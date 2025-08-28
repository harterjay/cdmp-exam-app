#!/usr/bin/env python3
"""
Create SQLite database from the extracted JSON file
"""

import sqlite3
import json
from pathlib import Path

def create_database_from_json():
    """Create SQLite database from the JSON file"""
    
    # Load the JSON data
    json_file = Path('cdmp_questions_complete.json')
    if not json_file.exists():
        raise FileNotFoundError("cdmp_questions_complete.json not found. Run extract_all_questions.js first.")
    
    with open(json_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    questions = data['questions']
    
    # Create database
    conn = sqlite3.connect('cdmp_questions.sqlite')
    cursor = conn.cursor()
    
    # Drop existing table if it exists
    cursor.execute('DROP TABLE IF EXISTS questions')
    
    # Create questions table
    cursor.execute('''
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
        )
    ''')
    
    # Create indexes for better query performance
    cursor.execute('CREATE INDEX idx_chapter ON questions(chapter)')
    cursor.execute('CREATE INDEX idx_knowledge_area ON questions(knowledge_area)')
    cursor.execute('CREATE INDEX idx_question_type ON questions(question_type)')
    
    # Insert all questions
    for question in questions:
        cursor.execute('''
            INSERT INTO questions (
                chapter, question_number, question_text, question_type,
                answers, correct_answer, knowledge_area, explanation
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', (
            question['chapter'],
            question['question_number'],
            question['question_text'],
            question['question_type'],
            json.dumps(question['answers']),
            json.dumps(question['correct_answer']),
            question['knowledge_area'],
            question['explanation']
        ))
    
    # Create summary view
    cursor.execute('''
        CREATE VIEW IF NOT EXISTS question_summary AS
        SELECT 
            chapter,
            knowledge_area,
            COUNT(*) as total_questions,
            SUM(CASE WHEN question_type = 'multiple-choice' THEN 1 ELSE 0 END) as multiple_choice_count,
            SUM(CASE WHEN question_type = 'multi-select' THEN 1 ELSE 0 END) as multi_select_count
        FROM questions
        GROUP BY chapter, knowledge_area
        ORDER BY chapter
    ''')
    
    conn.commit()
    
    # Verify database
    cursor.execute('SELECT COUNT(*) FROM questions')
    total_count = cursor.fetchone()[0]
    print(f"Successfully created database with {total_count} questions")
    
    # Show summary
    print("\nDatabase Summary:")
    cursor.execute('SELECT * FROM question_summary')
    for row in cursor.fetchall():
        chapter, knowledge_area, total, mc, ms = row
        print(f"  {chapter}: {total} questions ({mc} multiple-choice, {ms} multi-select)")
    
    conn.close()
    
    return True

def test_database_queries():
    """Test some sample database queries"""
    conn = sqlite3.connect('cdmp_questions.sqlite')
    cursor = conn.cursor()
    
    print("\n" + "="*60)
    print("SAMPLE DATABASE QUERIES")
    print("="*60)
    
    # Query 1: Get all questions from Chapter 1
    print("\n1. All questions from Chapter 1:")
    cursor.execute("SELECT id, question_text FROM questions WHERE chapter LIKE 'Chapter 1%' LIMIT 3")
    for row in cursor.fetchall():
        print(f"   Q{row[0]}: {row[1][:80]}...")
    
    # Query 2: Count questions by type
    print("\n2. Questions by type:")
    cursor.execute("SELECT question_type, COUNT(*) FROM questions GROUP BY question_type")
    for row in cursor.fetchall():
        print(f"   {row[0]}: {row[1]} questions")
    
    # Query 3: Multi-select questions
    print("\n3. Sample multi-select questions:")
    cursor.execute("SELECT chapter, question_text FROM questions WHERE question_type = 'multi-select' LIMIT 2")
    for row in cursor.fetchall():
        print(f"   {row[0]}: {row[1][:60]}...")
    
    # Query 4: Questions with answers
    print("\n4. Sample question with answers:")
    cursor.execute("SELECT question_text, answers, correct_answer FROM questions LIMIT 1")
    row = cursor.fetchone()
    if row:
        answers = json.loads(row[1])
        correct = json.loads(row[2])
        print(f"   Question: {row[0][:80]}...")
        print(f"   Answers: {len(answers)} options")
        print(f"   Correct: {correct}")
    
    conn.close()

def main():
    """Main function"""
    print("Creating SQLite database from JSON data...")
    
    try:
        create_database_from_json()
        test_database_queries()
        
        print(f"\n" + "="*60)
        print("SUCCESS!")
        print("="*60)
        print("Database created: cdmp_questions.sqlite")
        print("\nYou can now query the database with:")
        print("  python -c \"import sqlite3; conn = sqlite3.connect('cdmp_questions.sqlite'); cursor = conn.cursor(); cursor.execute('SELECT * FROM question_summary'); [print(row) for row in cursor.fetchall()]\"")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()