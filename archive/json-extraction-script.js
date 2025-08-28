// Complete CDMP JSON Extraction Script
// Run this in a browser console or Node.js with the PDF text content

async function extractCDMPQuestions(fileContent) {
    const lines = fileContent.split('\n').map(line => line.trim());
    const examData = {};
    let currentChapter = '';
    let i = 0;

    // Find the start of Chapter 1
    while (i < lines.length && lines[i] !== 'Chapter 1') {
        i++;
    }

    console.log('Starting extraction...');

    while (i < lines.length) {
        const line = lines[i];
        
        // Check if this is a chapter heading
        if (line.match(/^Chapter \d+$/) || line.match(/^Practice Test [12]$/)) {
            currentChapter = line;
            examData[currentChapter] = [];
            console.log('Processing:', currentChapter);
            i++;
            continue;
        }
        
        // Check if this is a question start
        if (line.match(/^Question \d+$/)) {
            i++; // Move past "Question X"
            
            // Get question text
            let questionText = '';
            while (i < lines.length && lines[i] !== 'Question Type' && lines[i].length > 0) {
                questionText += (questionText ? ' ' : '') + lines[i];
                i++;
            }
            
            // Skip "Question Type" and get the type
            if (i < lines.length && lines[i] === 'Question Type') {
                i++;
                const questionType = i < lines.length ? lines[i] : '';
                i++;
                
                // Get answers
                const answers = [];
                let answerNum = 1;
                while (i < lines.length && lines[i] === `Answer ${answerNum}`) {
                    i++; // Skip "Answer X"
                    let answerText = '';
                    while (i < lines.length && 
                           !lines[i].match(/^Answer \d+$/) && 
                           lines[i] !== 'Correct Response' &&
                           lines[i].length > 0) {
                        answerText += (answerText ? ' ' : '') + lines[i];
                        i++;
                    }
                    if (answerText) {
                        answers.push(answerText);
                    }
                    answerNum++;
                }
                
                // Get correct response
                let correct = [];
                if (i < lines.length && lines[i] === 'Correct Response') {
                    i++;
                    if (i < lines.length) {
                        const correctText = lines[i];
                        correct = correctText.split(',').map(n => parseInt(n.trim()) - 1);
                    }
                    i++;
                }
                
                // Skip to explanation
                while (i < lines.length && lines[i] !== 'Explanation') {
                    i++;
                }
                
                let explanation = '';
                if (i < lines.length && lines[i] === 'Explanation') {
                    i++;
                    if (i < lines.length) {
                        explanation = lines[i];
                    }
                    i++;
                }
                
                // Skip to end of question
                while (i < lines.length && 
                       lines[i] !== 'Knowledge Area' && 
                       !lines[i].match(/^Question \d+$/) &&
                       !lines[i].match(/^Chapter \d+$/) &&
                       !lines[i].match(/^Practice Test [12]$/)) {
                    i++;
                }
                
                if (lines[i] === 'Knowledge Area') {
                    i += 2; // Skip "Knowledge Area" and the area name
                }
                
                // Add question if valid
                if (currentChapter && questionText && answers.length > 0) {
                    examData[currentChapter].push({
                        question: questionText,
                        type: questionType,
                        answers: answers,
                        correct: correct,
                        explanation: explanation
                    });
                }
            }
            continue;
        }
        
        i++;
    }

    // Create the complete JSON structure
    const completeDataset = {
        metadata: {
            title: "CDMP Exam Questions Dataset",
            description: "Complete question bank for CDMP certification preparation based on DMBOK2",
            totalQuestions: Object.values(examData).reduce((sum, ch) => sum + ch.length, 0),
            totalChapters: Object.keys(examData).length,
            version: "1.0",
            extractedDate: new Date().toISOString().split('T')[0]
        },
        chapters: {}
    };

    // Add each chapter with metadata
    Object.keys(examData).forEach(chapterKey => {
        const questions = examData[chapterKey];
        completeDataset.chapters[chapterKey] = {
            title: chapterKey,
            questionCount: questions.length,
            questions: questions
        };
    });

    console.log('\n=== EXTRACTION COMPLETE ===');
    console.log('Total questions:', completeDataset.metadata.totalQuestions);
    console.log('Total chapters:', completeDataset.metadata.totalChapters);
    console.log('JSON size:', Math.round(JSON.stringify(completeDataset).length / 1024), 'KB');
    
    // Display breakdown
    Object.keys(completeDataset.chapters).forEach(chapter => {
        console.log(`  ${chapter}: ${completeDataset.chapters[chapter].questionCount} questions`);
    });

    return completeDataset;
}

// Usage instructions:
/*
1. Copy your PDF text content into a variable called 'pdfContent'
2. Run: const dataset = await extractCDMPQuestions(pdfContent);
3. Download as JSON: 
   const jsonString = JSON.stringify(dataset, null, 2);
   const blob = new Blob([jsonString], { type: 'application/json' });
   const url = URL.createObjectURL(blob);
   const a = document.createElement('a');
   a.href = url;
   a.download = 'cdmp-questions.json';
   a.click();
*/

// For your web app, load the JSON like this:
/*
// Option 1: Fetch from server
const response = await fetch('./data/cdmp-questions.json');
const examData = await response.json();

// Option 2: Import as ES module (if you save as .js)
import examData from './data/cdmp-questions.js';

// Then use in your app:
const chapter1Questions = examData.chapters['Chapter 1'].questions;
const allQuestions = Object.values(examData.chapters)
    .flatMap(chapter => chapter.questions);
*/