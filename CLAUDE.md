# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a web-based CDMP (Certified Data Management Professional) exam study application. The application provides interactive practice questions based on the DAMA-DMBOK2 framework across all 17 knowledge areas to help data professionals prepare for certification.

## Development Environment

### How to Run the Application
- Open `main.html` in a web browser (Chrome, Firefox, Safari, Edge)
- No build process or server required - this is a static client-side application

### Testing Changes
- Save changes to HTML/CSS/JavaScript files
- Refresh the browser to see updates
- Use browser developer tools for debugging (F12)

## Architecture and Code Structure

### Key Files
- `main.html` - Main application file containing HTML, CSS, and JavaScript
- `cdmp-questions-js.js` - Complete question database with 368+ CDMP exam questions
- `json-extraction-script.js` - Utility script for extracting questions from PDF content
- `cdmp_exam_questions.sqlite` - SQLite database containing exam questions
- `examdata_only.txt` - Raw text data of exam questions

### Application Structure
The application is a single-page vanilla JavaScript application with three main sections:
1. **Setup Section** - Chapter selection and study mode selection
2. **Quiz Section** - Question display and navigation
3. **Results Section** - Score display and performance breakdown

### Data Structure
Questions are organized in JavaScript objects with this format:
```javascript
examData = {
  "Chapter Name": [
    {
      question: "Question text",
      type: "multiple-choice" | "multi-select", 
      answers: ["Answer 1", "Answer 2", ...],
      correct: [index_array], // 0-based indices
      explanation: "Reference to DMBOK2 page"
    }
  ]
}
```

### Key Components
- **Chapter Selection**: Grid-based chapter selector with checkboxes
- **Mode Selection**: Practice mode (immediate feedback) vs Exam mode (end feedback)
- **Question Engine**: Handles question display, answer validation, and navigation
- **Progress Tracking**: Visual progress bar and question counters
- **Results Calculation**: Score computation and performance statistics

## Content and Data

### Question Database
- 368+ questions across 17 DMBOK2 knowledge areas plus practice tests
- Chapters 1-17: Core DMBOK2 knowledge areas
- Practice Tests 1-2: Comprehensive exam simulations
- Question types: multiple-choice (single answer) and multi-select (multiple correct answers)

### Content Guidelines
- All questions based on DMBOK2 content with page references
- Explanations reference specific DMBOK2 pages
- Questions cover foundational to advanced difficulty levels

## UI/UX Design

### Visual Theme
- Professional gradient theme (blue to purple)
- Card-based interface design
- Responsive layout supporting mobile devices (320px+ width)
- Modern typography with Segoe UI font stack

### Responsive Breakpoints
- Mobile: max-width 768px
- Grid layouts collapse to single column on mobile
- Navigation adapts to vertical layout on small screens

## Technical Constraints

- **Client-side only**: No backend server or database required
- **Static hosting**: Deployable to GitHub Pages, Netlify, or similar
- **Browser compatibility**: Modern browsers with ES6+ support
- **No build tools**: Vanilla HTML/CSS/JavaScript without bundlers

## Common Development Tasks

### Adding New Questions
1. Edit `cdmp-questions-js.js`
2. Add questions to appropriate chapter array following the data structure format
3. Ensure correct answer indices are 0-based
4. Include DMBOK2 page references in explanations

### Modifying UI Components
1. Edit the HTML structure in `main.html` 
2. Update corresponding CSS styles in the `<style>` section
3. Modify JavaScript event handlers and logic in the `<script>` section

### Testing Different Question Sets
1. Modify the `examData` object in `main.html` (or replace with import from `cdmp-questions-js.js`)
2. Use browser developer tools to inspect question flow
3. Test both practice and exam modes

### Debugging Common Issues
- **Questions not loading**: Check `examData` object structure and browser console for errors
- **Navigation problems**: Verify event listeners are properly attached in `setupEventListeners()`
- **Scoring issues**: Review answer validation logic in quiz engine functions
- **Mobile display issues**: Test responsive breakpoints and touch interactions

## Future Enhancement Areas

### Phase 2 Planned Features
- User account system with progress tracking
- Performance analytics dashboard  
- Structured study plans and learning paths
- Question bookmarking for review

### Technical Debt and Improvements
- Separate JavaScript into modules for better maintainability
- Add TypeScript for better type safety
- Implement state management for complex user interactions
- Add automated testing suite
- Progressive Web App features for offline support

## Content Copyright and Compliance

- Questions are derivative educational content based on publicly available DMBOK2 material
- All content follows fair use guidelines for educational purposes
- Maintain attribution to DAMA-DMBOK2 source material
- Avoid reproducing extensive passages from copyrighted content