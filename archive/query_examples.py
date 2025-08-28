#!/usr/bin/env python3
"""
CDMP Questions Database Query Examples

This script demonstrates various ways to query the CDMP questions database
and provides examples for common use cases.
"""

import sqlite3
import json
from datetime import datetime

def connect_db():
    """Connect to the database"""
    return sqlite3.connect('cdmp_questions.sqlite')

def print_separator(title):
    """Print a formatted separator"""
    print("\n" + "="*60)
    print(f" {title}")
    print("="*60)

def query_by_chapter(chapter_filter=None):
    """Query questions by chapter"""
    conn = connect_db()
    cursor = conn.cursor()
    
    if chapter_filter:
        cursor.execute("""
            SELECT id, chapter, question_number, question_text, question_type 
            FROM questions 
            WHERE chapter LIKE ? 
            ORDER BY question_number
        """, (f"%{chapter_filter}%",))
        print(f"Questions from chapters matching '{chapter_filter}':")
    else:
        cursor.execute("""
            SELECT id, chapter, question_number, question_text, question_type 
            FROM questions 
            ORDER BY chapter, question_number
        """)
        print("All questions:")
    
    for row in cursor.fetchall():
        print(f"  #{row[0]} | {row[1]} Q{row[2]} | {row[4]} | {row[3][:70]}...")
    
    conn.close()

def query_by_type(question_type):
    """Query questions by type"""
    conn = connect_db()
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT chapter, question_text, answers, correct_answer 
        FROM questions 
        WHERE question_type = ? 
        LIMIT 5
    """, (question_type,))
    
    print(f"Sample {question_type} questions:")
    for row in cursor.fetchall():
        answers = json.loads(row[2])
        correct = json.loads(row[3])
        print(f"\nChapter: {row[0]}")
        print(f"Question: {row[1][:80]}...")
        print(f"Answers ({len(answers)} options):")
        for i, answer in enumerate(answers):
            marker = "✓" if i in correct else " "
            print(f"  {marker} {i}: {answer[:60]}...")
    
    conn.close()

def query_by_knowledge_area(area):
    """Query questions by knowledge area"""
    conn = connect_db()
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT chapter, COUNT(*) as count
        FROM questions 
        WHERE knowledge_area LIKE ?
        GROUP BY chapter
        ORDER BY chapter
    """, (f"%{area}%",))
    
    print(f"Chapters in '{area}' knowledge area:")
    total = 0
    for row in cursor.fetchall():
        print(f"  {row[0]}: {row[1]} questions")
        total += row[1]
    
    print(f"Total: {total} questions")
    conn.close()

def get_statistics():
    """Get comprehensive database statistics"""
    conn = connect_db()
    cursor = conn.cursor()
    
    print("Database Statistics:")
    
    # Total questions
    cursor.execute("SELECT COUNT(*) FROM questions")
    total = cursor.fetchone()[0]
    print(f"  Total Questions: {total}")
    
    # Questions by type
    cursor.execute("""
        SELECT question_type, COUNT(*) 
        FROM questions 
        GROUP BY question_type
        ORDER BY COUNT(*) DESC
    """)
    print("\n  Questions by Type:")
    for row in cursor.fetchall():
        percentage = (row[1] / total) * 100
        print(f"    {row[0]}: {row[1]} ({percentage:.1f}%)")
    
    # Questions by knowledge area
    cursor.execute("""
        SELECT knowledge_area, COUNT(*) 
        FROM questions 
        GROUP BY knowledge_area
        ORDER BY COUNT(*) DESC
    """)
    print("\n  Questions by Knowledge Area:")
    for row in cursor.fetchall():
        print(f"    {row[0]}: {row[1]} questions")
    
    # Chapter distribution
    cursor.execute("""
        SELECT 
            COUNT(DISTINCT chapter) as total_chapters,
            AVG(chapter_count) as avg_per_chapter,
            MIN(chapter_count) as min_per_chapter,
            MAX(chapter_count) as max_per_chapter
        FROM (
            SELECT chapter, COUNT(*) as chapter_count 
            FROM questions 
            GROUP BY chapter
        ) chapter_stats
    """)
    row = cursor.fetchone()
    print(f"\n  Chapter Distribution:")
    print(f"    Total Chapters: {row[0]}")
    print(f"    Average per Chapter: {row[1]:.1f}")
    print(f"    Range: {row[2]} - {row[3]} questions")
    
    conn.close()

def search_questions(search_term):
    """Search questions by text content"""
    conn = connect_db()
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT chapter, question_text, explanation
        FROM questions 
        WHERE question_text LIKE ? OR explanation LIKE ?
        LIMIT 10
    """, (f"%{search_term}%", f"%{search_term}%"))
    
    print(f"Questions containing '{search_term}':")
    for row in cursor.fetchall():
        print(f"\nChapter: {row[0]}")
        print(f"Question: {row[1][:100]}...")
        if search_term.lower() in row[2].lower():
            print(f"Explanation: {row[2]}")
    
    conn.close()

def export_chapter_to_dict(chapter):
    """Export a specific chapter to a dictionary format"""
    conn = connect_db()
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT question_number, question_text, question_type, answers, correct_answer, explanation
        FROM questions 
        WHERE chapter LIKE ?
        ORDER BY question_number
    """, (f"%{chapter}%",))
    
    questions = []
    for row in cursor.fetchall():
        questions.append({
            'question_number': row[0],
            'question': row[1],
            'type': row[2],
            'answers': json.loads(row[3]),
            'correct': json.loads(row[4]),
            'explanation': row[5]
        })
    
    conn.close()
    return questions

def create_practice_quiz(knowledge_areas=None, question_count=10, question_type=None):
    """Create a random practice quiz"""
    conn = connect_db()
    cursor = conn.cursor()
    
    # Build query based on filters
    where_clauses = []
    params = []
    
    if knowledge_areas:
        placeholders = ','.join(['?' for _ in knowledge_areas])
        where_clauses.append(f"knowledge_area IN ({placeholders})")
        params.extend(knowledge_areas)
    
    if question_type:
        where_clauses.append("question_type = ?")
        params.append(question_type)
    
    where_sql = "WHERE " + " AND ".join(where_clauses) if where_clauses else ""
    
    cursor.execute(f"""
        SELECT id, chapter, question_text, question_type, answers, correct_answer, explanation
        FROM questions 
        {where_sql}
        ORDER BY RANDOM()
        LIMIT ?
    """, params + [question_count])
    
    quiz_questions = []
    for row in cursor.fetchall():
        quiz_questions.append({
            'id': row[0],
            'chapter': row[1],
            'question': row[2],
            'type': row[3],
            'answers': json.loads(row[4]),
            'correct': json.loads(row[5]),
            'explanation': row[6]
        })
    
    conn.close()
    return quiz_questions

def main():
    """Demonstrate various database queries"""
    
    print_separator("CDMP Questions Database Query Examples")
    print(f"Generated on: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    # Basic statistics
    print_separator("1. DATABASE STATISTICS")
    get_statistics()
    
    # Query by chapter
    print_separator("2. QUESTIONS BY CHAPTER (Sample: Chapter 1)")
    query_by_chapter("Chapter 1")
    
    # Query by type
    print_separator("3. MULTI-SELECT QUESTIONS (Sample)")
    query_by_type("multi-select")
    
    # Query by knowledge area
    print_separator("4. QUESTIONS BY KNOWLEDGE AREA (Data Management)")
    query_by_knowledge_area("Data Management")
    
    # Search functionality
    print_separator("5. SEARCH QUESTIONS (DMBOK)")
    search_questions("DMBOK")
    
    # Create practice quiz
    print_separator("6. RANDOM PRACTICE QUIZ (5 questions)")
    quiz = create_practice_quiz(question_count=5)
    for i, q in enumerate(quiz, 1):
        print(f"\nQ{i}: {q['question'][:80]}...")
        print(f"     Type: {q['type']} | Chapter: {q['chapter']}")
    
    # Export chapter example
    print_separator("7. EXPORT CHAPTER DATA (Chapter 1 sample)")
    chapter_data = export_chapter_to_dict("Chapter 1")
    print(f"Exported {len(chapter_data)} questions from Chapter 1")
    print(f"Sample question: {chapter_data[0]['question'][:60]}...")
    
    print_separator("QUERY EXAMPLES COMPLETE")
    print("You can use these patterns to build your own queries!")
    print("Database file: cdmp_questions.sqlite")

if __name__ == "__main__":
    main()