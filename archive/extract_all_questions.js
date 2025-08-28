#!/usr/bin/env node
/**
 * Complete CDMP Questions Extractor
 * 
 * This Node.js script extracts all questions from main.html and creates both
 * a JSON file and SQLite database with all 368+ questions.
 */

const fs = require('fs');
const path = require('path');

// Load the HTML file and extract examData
function extractExamDataFromHTML() {
    const htmlContent = fs.readFileSync('main.html', 'utf8');
    
    // Find the examData object
    const startPattern = 'const examData = {';
    const startIndex = htmlContent.indexOf(startPattern);
    
    if (startIndex === -1) {
        throw new Error('Could not find examData in main.html');
    }
    
    // Find the end by counting braces
    let braceCount = 0;
    let currentIndex = startIndex + startPattern.length - 1; // Start at the opening brace
    let inString = false;
    let escapeNext = false;
    let endIndex = -1;
    
    while (currentIndex < htmlContent.length) {
        const char = htmlContent[currentIndex];
        
        if (escapeNext) {
            escapeNext = false;
        } else if (char === '\\') {
            escapeNext = true;
        } else if (char === '"' && !escapeNext) {
            inString = !inString;
        } else if (!inString) {
            if (char === '{') {
                braceCount++;
            } else if (char === '}') {
                braceCount--;
                if (braceCount === 0) {
                    endIndex = currentIndex;
                    break;
                }
            }
        }
        
        currentIndex++;
    }
    
    if (endIndex === -1) {
        throw new Error('Could not find end of examData object');
    }
    
    // Extract the JavaScript code
    const jsCode = htmlContent.substring(startIndex, endIndex + 1);
    
    // Evaluate the JavaScript to get the object
    // This is safe since we control the source
    const examDataCode = jsCode.replace('const examData = ', '');
    const examData = eval('(' + examDataCode + ')');
    
    return examData;
}

// Knowledge area mapping
const knowledgeAreas = {
    "Chapter 1": "Data Management",
    "Chapter 2": "Data Handling Ethics", 
    "Chapter 3": "Data Governance",
    "Chapter 4": "Data Architecture",
    "Chapter 5": "Data Modeling and Design",
    "Chapter 6": "Data Storage and Operations",
    "Chapter 7": "Data Security",
    "Chapter 8": "Data Integration and Interoperability",
    "Chapter 9": "Document and Content Management",
    "Chapter 10": "Reference and Master Data",
    "Chapter 11": "Data Warehousing and Business Intelligence",
    "Chapter 12": "Metadata Management",
    "Chapter 13": "Data Quality",
    "Chapter 14": "Big Data and Data Science",
    "Chapter 15": "Data Management Maturity Assessment",
    "Chapter 16": "Data Management Organization and Role Expectations",
    "Chapter 17": "Data Management and Organizational Change Management",
    "Practice Test 1": "Comprehensive Practice Exam",
    "Practice Test 2": "Comprehensive Practice Exam"
};

function getKnowledgeArea(chapter) {
    // Handle chapters with full names (e.g., "Chapter 1: Data Management")
    for (const [key, value] of Object.entries(knowledgeAreas)) {
        if (chapter.startsWith(key)) {
            return value;
        }
    }
    
    // Fallback
    return chapter.replace("Chapter ", "").replace(":", "").trim();
}

// Convert to flat array with metadata
function convertToFlatStructure(examData) {
    const questions = [];
    let globalId = 1;
    
    for (const [chapter, chapterQuestions] of Object.entries(examData)) {
        chapterQuestions.forEach((question, index) => {
            questions.push({
                id: globalId++,
                chapter: chapter,
                question_number: index + 1,
                question_text: question.question,
                question_type: question.type,
                answers: question.answers,
                correct_answer: question.correct,
                knowledge_area: getKnowledgeArea(chapter),
                explanation: question.explanation
            });
        });
    }
    
    return questions;
}

// Generate SQL INSERT statements
function generateSQLInserts(questions) {
    let sql = `-- CDMP Questions Database
-- Generated from main.html examData
-- Total questions: ${questions.length}

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    chapter TEXT NOT NULL,
    question_number INTEGER NOT NULL,
    question_text TEXT NOT NULL,
    question_type TEXT NOT NULL,
    answers TEXT NOT NULL,  -- JSON array
    correct_answer TEXT NOT NULL,  -- JSON array
    knowledge_area TEXT NOT NULL,
    explanation TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better query performance
CREATE INDEX idx_chapter ON questions(chapter);
CREATE INDEX idx_knowledge_area ON questions(knowledge_area);
CREATE INDEX idx_question_type ON questions(question_type);

-- Insert all questions
`;

    questions.forEach(q => {
        const escapeSql = (str) => {
            if (!str) return "''";
            return "'" + str.replace(/'/g, "''").replace(/\n/g, '\\n').replace(/\r/g, '\\r') + "'";
        };
        
        sql += `INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    ${escapeSql(q.chapter)},
    ${q.question_number},
    ${escapeSql(q.question_text)},
    ${escapeSql(q.question_type)},
    ${escapeSql(JSON.stringify(q.answers))},
    ${escapeSql(JSON.stringify(q.correct_answer))},
    ${escapeSql(q.knowledge_area)},
    ${escapeSql(q.explanation)}
);

`;
    });

    // Add summary view
    sql += `-- Create summary view
CREATE VIEW IF NOT EXISTS question_summary AS
SELECT 
    chapter,
    knowledge_area,
    COUNT(*) as total_questions,
    SUM(CASE WHEN question_type = 'multiple-choice' THEN 1 ELSE 0 END) as multiple_choice_count,
    SUM(CASE WHEN question_type = 'multi-select' THEN 1 ELSE 0 END) as multi_select_count
FROM questions
GROUP BY chapter, knowledge_area
ORDER BY chapter;

-- Summary statistics
SELECT 'Total Questions' as metric, COUNT(*) as value FROM questions
UNION ALL
SELECT 'Total Chapters', COUNT(DISTINCT chapter) FROM questions  
UNION ALL
SELECT 'Multiple Choice', COUNT(*) FROM questions WHERE question_type = 'multiple-choice'
UNION ALL  
SELECT 'Multi Select', COUNT(*) FROM questions WHERE question_type = 'multi-select';
`;

    return sql;
}

// Generate summary report
function generateSummary(questions) {
    const summary = {
        total_questions: questions.length,
        chapters: {},
        question_types: {}
    };
    
    questions.forEach(q => {
        // Count by chapter
        if (!summary.chapters[q.chapter]) {
            summary.chapters[q.chapter] = {
                count: 0,
                knowledge_area: q.knowledge_area
            };
        }
        summary.chapters[q.chapter].count++;
        
        // Count by type
        if (!summary.question_types[q.question_type]) {
            summary.question_types[q.question_type] = 0;
        }
        summary.question_types[q.question_type]++;
    });
    
    return summary;
}

// Main execution
function main() {
    try {
        console.log('Extracting examData from main.html...');
        
        const examData = extractExamDataFromHTML();
        console.log('Successfully extracted examData');
        
        // Convert to flat structure
        const questions = convertToFlatStructure(examData);
        console.log(`Converted ${questions.length} questions`);
        
        // Generate summary
        const summary = generateSummary(questions);
        
        // Save JSON file
        fs.writeFileSync('cdmp_questions_complete.json', JSON.stringify({
            metadata: {
                title: "Complete CDMP Questions Database",
                description: "All questions extracted from main.html examData",
                total_questions: questions.length,
                extracted_date: new Date().toISOString()
            },
            summary: summary,
            questions: questions
        }, null, 2));
        
        // Save SQL file
        const sql = generateSQLInserts(questions);
        fs.writeFileSync('cdmp_questions_complete.sql', sql);
        
        // Print summary
        console.log('\n=== EXTRACTION COMPLETE ===');
        console.log(`Total questions: ${summary.total_questions}`);
        console.log(`Total chapters: ${Object.keys(summary.chapters).length}`);
        
        console.log('\nQuestions by chapter:');
        for (const [chapter, info] of Object.entries(summary.chapters)) {
            console.log(`  ${chapter}: ${info.count} questions (${info.knowledge_area})`);
        }
        
        console.log('\nQuestions by type:');
        for (const [type, count] of Object.entries(summary.question_types)) {
            console.log(`  ${type}: ${count} questions`);
        }
        
        console.log('\nGenerated files:');
        console.log('  - cdmp_questions_complete.json (JSON format)');
        console.log('  - cdmp_questions_complete.sql (SQL statements)');
        
        console.log('\nTo create SQLite database, run:');
        console.log('  sqlite3 cdmp_questions.sqlite < cdmp_questions_complete.sql');
        
    } catch (error) {
        console.error('Error:', error.message);
        console.error('Make sure main.html exists and contains the examData object');
    }
}

if (require.main === module) {
    main();
}