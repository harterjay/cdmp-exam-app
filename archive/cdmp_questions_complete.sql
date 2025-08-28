-- CDMP Questions Database
-- Generated from main.html examData
-- Total questions: 81

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
INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    1,
    'Please select the correct definition of Data Management from the options below.',
    'multiple-choice',
    '["Data Management is the strict control of all plans, policies, programs and practices that enable the business strategy to be successfully executed.","Data Management is the development, execution and supervision of plans, policies, programs and practices that deliver, control, protect and enhance the value of data and information assets throughout their lifecycles.","Data Management is the development, execution and supervision of plans, policies, programs and practices that deliver, control, protect and enhance the value of data assets throughout their lifecycles.","Data Management is the development, execution and supervision of plans, policies, programs and practices that deliver, control, protect and enhance the value of information assets throughout their lifecycles."]',
    '[1]',
    'Data Management',
    'Please refer to page 17 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    2,
    'Data Management Professionals only work with the technical aspects related to data.',
    'multiple-choice',
    '["True","False"]',
    '[1]',
    'Data Management',
    'Please refer to page 17 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    3,
    'Differentiating between data and information. Please select the correct answers based on the sentence below: Here is a marketing report for the last month [1]. It is based on data from our data warehouse [2]. Next month these results [3] will be used to generate our month-over-month performance measure [4].',
    'multiple-choice',
    '["[1] Information, [2] Information, [3] Data, [4] Information","[1] Data, [2] Information, [3] Data, [4] Data","[1] Data, [2] Data, [3] Data, [4] Information","[1] Information, [2] Data, [3] Data, [4] Information"]',
    '[3]',
    'Data Management',
    'Please refer to page 17 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    4,
    'Please select the answers that correctly describes the set of principles that recognizes salient features of data management and guide data management practice.',
    'multi-select',
    '["Data is an asset with unique properties.","It takes Metadata to manage data.","The most important part of data management is security.","Data management is lifecycle management.","Effective data management requires leadership commitment.","Efficient data management requires a team of IT professionals only."]',
    '[0,1,3,4]',
    'Data Management',
    'Please refer to page 22-23 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    5,
    'Value is the difference between the cost of a thing and the benefit derived from that thing.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 24 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    6,
    'Please select the correct general cost and benefit categories that can be applied consistently within an organization.',
    'multi-select',
    '["Cost of erasing data from servers","Cost of improving data","What the data could be sold for","Benefit of higher quality data","Cost of replacing data if it were lost","What competitors would pay for data"]',
    '[1,2,3,4,5]',
    'Data Management',
    'Please refer to page 24 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    7,
    'Please select the answers that correctly describes where the costs of poor quality data comes from.',
    'multi-select',
    '["Scrap and rework","Organizational conflict","High job satisfaction","High productivity","Reputational costs","Compliance costs"]',
    '[0,1,4,5]',
    'Data Management',
    'Please refer to page 25-26 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    8,
    'Reduced risk is a benefit of high quality data.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 25-26 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    9,
    'The better an organization understands the lifecycle and lineage of its data, the better able it will be to manage its data. Please select correct implication of the focus of data management on the data lifecycle.',
    'multiple-choice',
    '["Data Quality must be managed throughout the data lifecycle","Data Security must only be managed at the start of the data lifecycle","Metadata Quality is the most important part of the management process","Data Management efforts should focus on the most critical data last"]',
    '[0]',
    'Data Management',
    'Please refer to page 29 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    10,
    'Information gaps represent enterprise liabilities with potentially profound impacts on operational effectiveness and profitability.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 30 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    11,
    'The DMBOK2 identifies how many knowledge areas for data management?',
    'multiple-choice',
    '["15","17","19","21"]',
    '[1]',
    'Data Management',
    'Please refer to page 19 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 1: Data Management',
    12,
    'Which principle states that different types of data have different lifecycle requirements?',
    'multiple-choice',
    '["Data is an asset with unique properties","The value of data can be and should be expressed in economic terms","Managing data means managing the quality of data","Data management is lifecycle management"]',
    '[3]',
    'Data Management',
    'Please refer to page 28 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    1,
    'Data handling ethics are concerned with how to procure, store, manage, use and dispose of data in ways that are aligned with ethical principles.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Handling Ethics',
    'Please refer to page 49 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    2,
    'The ethics of data handling are complex, but is centred on several core concepts. Please select the correct answers.',
    'multi-select',
    '["Impact on machines","Impact on people","Potential for data management","Potential for misuse","Economic value of ethics","Economics value of data"]',
    '[1,3,5]',
    'Data Handling Ethics',
    'Please refer to page 49 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    3,
    'Within the Data Handling Ethics Context Diagram a key deliverable is the Ethical Data Handling Strategy.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Handling Ethics',
    'Please refer to page 50 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    4,
    'The Belmont principles that may be adapted for Information Management disciplines, include:',
    'multi-select',
    '["Respect for Persons","Respect for Machines","Beneficence","Criminality","Justice"]',
    '[0,2,4]',
    'Data Handling Ethics',
    'Please refer to page 52 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    5,
    'Please select the correct principles of the General Data Protection Regulation (GDPR) of the EU.',
    'multi-select',
    '["Purpose Limitation","Data Minimisation","Accuracy","Storage Limitation","Accountability","All of the above"]',
    '[5]',
    'Data Handling Ethics',
    'Please refer to page 54 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    6,
    'Misleading visualisations could be an example where a base level of truthfulness and transparency are not adhered to.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Handling Ethics',
    'Please refer to page 57 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    7,
    'Bias refers to an inclination of outlook. Please select the types of data bias:',
    'multi-select',
    '["Data collection for pre-defined results","Hunch and search","Positive reinforcement","Context and Emotion","Biased use of data collected","Biased sampling methodology"]',
    '[0,1,4,5]',
    'Data Handling Ethics',
    'Please refer to page 58-59 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    8,
    'If data is not integrated with care it presents risk for unethical data handling. These ethical risks intersect with fundamental problems in data management including: Limited knowledge of data''s origin and lineage; Data of poor quality; Unreliable Metadata; and Documentation of error remediation.',
    'multiple-choice',
    '["True","False"]',
    '[1]',
    'Data Handling Ethics',
    'Please refer to page 59-60 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    9,
    'Obfuscating or redacting data is the practice of making information anonymous ot removing sensitive information. Risks are present in the following instances:',
    'multi-select',
    '["Data storage","Data marketing","Data aggregation","Data marking","Data masking","Data integration"]',
    '[2,3,4]',
    'Data Handling Ethics',
    'Please refer to page 60 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    10,
    'Improving an organization''s ethical behaviour requires an informal Organizational Change Management (OCM) process.',
    'multiple-choice',
    '["True","False"]',
    '[1]',
    'Data Handling Ethics',
    'Please refer to page 61 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    11,
    'The principle of data minimisation means:',
    'multiple-choice',
    '["Collecting as much data as possible","Collecting only what is necessary for the stated purpose","Minimizing data storage costs","Reducing data processing time"]',
    '[1]',
    'Data Handling Ethics',
    'Please refer to page 54 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 2: Data Handling Ethics',
    12,
    'Consent for data collection should be:',
    'multi-select',
    '["Freely given","Specific","Informed","Ambiguous","Unambiguous"]',
    '[0,1,2,4]',
    'Data Handling Ethics',
    'Please refer to page 55 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 3: Data Governance',
    1,
    'The purpose of data governance is to ensure that data is managed properly, according to policies and best practices. Data governance is focused on how decisions are made about data and how people and processes are expected to behave in relation to data.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Governance',
    'Please refer to page 67-68 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 3: Data Governance',
    2,
    'The scope and focus of any data governance program depend on organizational needs, but most programs include:',
    'multi-select',
    '["Strategy","Policy","Data Management Projects","Compliance","Oversight","All of the above"]',
    '[5]',
    'Data Governance',
    'Please refer to page 68 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 3: Data Governance',
    3,
    'A goal of data governance is to enable an organisation to manage its data as a liability.',
    'multiple-choice',
    '["True","False"]',
    '[1]',
    'Data Governance',
    'Please refer to page 69 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 3: Data Governance',
    4,
    'Drivers for data governance most often focus on reducing risk or improving processes. Please select the elements that relate to the reduction in risk:',
    'multi-select',
    '["Specific risk management","General risk management","Data ethics","Data security","Publicity","Privacy"]',
    '[1,3,5]',
    'Data Governance',
    'Please refer to page 70 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 3: Data Governance',
    5,
    'Drivers for data governance most often focus on reducing risk or improving processes. Please select the elements that relate to the improvement of processes:',
    'multi-select',
    '["Regulatory compliance","Data quality improvements","Metadata management","Efficiency in development projects","Vendor management","All of the above"]',
    '[5]',
    'Data Governance',
    'Please refer to page 70 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 3: Data Governance',
    6,
    'Data governance operating model components include:',
    'multi-select',
    '["Organization and roles","Governance processes","Data rules and standards","Metrics and scorecards","All of the above"]',
    '[4]',
    'Data Governance',
    'Please refer to page 72 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 3: Data Governance',
    7,
    'The Data Governance Council typically includes:',
    'multi-select',
    '["Senior business executives","IT leadership","Data stewards","Legal representatives","All of the above"]',
    '[4]',
    'Data Governance',
    'Please refer to page 73 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 4: Data Architecture',
    1,
    'Data architecture describes the structure of an organization''s logical and physical data assets and data management resources.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Architecture',
    'Please refer to page 87 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 4: Data Architecture',
    2,
    'Which of the following are components of data architecture?',
    'multi-select',
    '["Data models","Data flows","Data stores","Data processing","All of the above"]',
    '[4]',
    'Data Architecture',
    'Please refer to page 88 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 4: Data Architecture',
    3,
    'Enterprise data architecture describes:',
    'multi-select',
    '["Data strategy and business case","Operating data model","Data integration architecture","Data governance","All of the above"]',
    '[4]',
    'Data Architecture',
    'Please refer to page 89 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 4: Data Architecture',
    4,
    'Data architecture principles should be:',
    'multi-select',
    '["Business-driven","Technology-independent","Consistent with enterprise architecture","Flexible and adaptable","All of the above"]',
    '[4]',
    'Data Architecture',
    'Please refer to page 90 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 5: Data Modeling and Design',
    1,
    'Data modeling is the process of discovering, analyzing and scoping data requirements, and then representing and communicating these data requirements in a precise form called the data model.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Modeling and Design',
    'Please refer to page 127 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 5: Data Modeling and Design',
    2,
    'Which are the three levels of data modeling?',
    'multi-select',
    '["Conceptual","Logical","Physical","Technical","Semantic"]',
    '[0,1,2]',
    'Data Modeling and Design',
    'Please refer to page 128 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 5: Data Modeling and Design',
    3,
    'A conceptual data model:',
    'multiple-choice',
    '["Contains detailed attribute definitions","Shows high-level business concepts and relationships","Includes physical implementation details","Specifies database table structures"]',
    '[1]',
    'Data Modeling and Design',
    'Please refer to page 129 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 5: Data Modeling and Design',
    4,
    'Normalization in data modeling aims to:',
    'multi-select',
    '["Eliminate data redundancy","Ensure data integrity","Improve performance","Reduce storage requirements","All of the above except performance"]',
    '[4]',
    'Data Modeling and Design',
    'Please refer to page 140 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 6: Data Storage and Operations',
    1,
    'Data storage and operations includes the design, implementation and support of stored data, to maximize its value throughout its lifecycle.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Storage and Operations',
    'Please refer to page 177 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 6: Data Storage and Operations',
    2,
    'Database management activities include:',
    'multi-select',
    '["Performance monitoring","Backup and recovery","Security management","Capacity planning","All of the above"]',
    '[4]',
    'Data Storage and Operations',
    'Please refer to page 180 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 6: Data Storage and Operations',
    3,
    'Database backup strategies include:',
    'multi-select',
    '["Full backups","Incremental backups","Differential backups","Transaction log backups","All of the above"]',
    '[4]',
    'Data Storage and Operations',
    'Please refer to page 185 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 6: Data Storage and Operations',
    4,
    'Database performance tuning involves:',
    'multi-select',
    '["Index optimization","Query optimization","Storage optimization","Memory management","All of the above"]',
    '[4]',
    'Data Storage and Operations',
    'Please refer to page 190 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 7: Data Security',
    1,
    'Data security ensures that data privacy and confidentiality are maintained, that data is not breached, and that data is accessed appropriately.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Security',
    'Please refer to page 223 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 7: Data Security',
    2,
    'The CIA triad in data security stands for:',
    'multi-select',
    '["Confidentiality","Integrity","Availability","Authentication","Authorization"]',
    '[0,1,2]',
    'Data Security',
    'Please refer to page 224 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 7: Data Security',
    3,
    'Access control methods include:',
    'multi-select',
    '["Role-based access control (RBAC)","Attribute-based access control (ABAC)","Mandatory access control (MAC)","Discretionary access control (DAC)","All of the above"]',
    '[4]',
    'Data Security',
    'Please refer to page 235 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 7: Data Security',
    4,
    'Data encryption can be applied at:',
    'multi-select',
    '["Data at rest","Data in transit","Data in use","Database level","All of the above"]',
    '[4]',
    'Data Security',
    'Please refer to page 240 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 7: Data Security',
    5,
    'Data loss prevention (DLP) tools help:',
    'multiple-choice',
    '["Prevent unauthorized data access","Monitor and prevent data exfiltration","Encrypt sensitive data","Backup critical data"]',
    '[1]',
    'Data Security',
    'Please refer to page 245 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 7: Data Security',
    6,
    'Security audit activities include:',
    'multi-select',
    '["Access log review","Vulnerability assessments","Penetration testing","Compliance validation","All of the above"]',
    '[4]',
    'Data Security',
    'Please refer to page 250 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 7: Data Security',
    7,
    'Data privacy regulations include:',
    'multi-select',
    '["GDPR (General Data Protection Regulation)","CCPA (California Consumer Privacy Act)","PIPEDA (Personal Information Protection and Electronic Documents Act)","HIPAA (Health Insurance Portability and Accountability Act)","All of the above"]',
    '[4]',
    'Data Security',
    'Please refer to page 255 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 7: Data Security',
    8,
    'Incident response planning should include:',
    'multi-select',
    '["Detection procedures","Response team roles","Communication protocols","Recovery procedures","All of the above"]',
    '[4]',
    'Data Security',
    'Please refer to page 260 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 7: Data Security',
    9,
    'Data classification schemes help:',
    'multiple-choice',
    '["Determine appropriate security controls","Improve data quality","Reduce storage costs","Increase processing speed"]',
    '[0]',
    'Data Security',
    'Please refer to page 230 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 8: Data Integration and Interoperability',
    1,
    'Data integration involves combining data from different sources to provide users with a unified view.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Integration and Interoperability',
    'Please refer to page 267 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 8: Data Integration and Interoperability',
    2,
    'Common data integration approaches include:',
    'multi-select',
    '["ETL (Extract, Transform, Load)","ELT (Extract, Load, Transform)","Data virtualization","Data replication","All of the above"]',
    '[4]',
    'Data Integration and Interoperability',
    'Please refer to page 270 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 8: Data Integration and Interoperability',
    3,
    'Data integration challenges include:',
    'multi-select',
    '["Data format differences","Semantic inconsistencies","Data quality issues","Performance bottlenecks","All of the above"]',
    '[4]',
    'Data Integration and Interoperability',
    'Please refer to page 275 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 8: Data Integration and Interoperability',
    4,
    'Master data integration patterns include:',
    'multi-select',
    '["Registry style","Repository style","Hybrid style","Transactional style","All of the above except transactional"]',
    '[4]',
    'Data Integration and Interoperability',
    'Please refer to page 280 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 8: Data Integration and Interoperability',
    5,
    'Data lineage tracking provides:',
    'multi-select',
    '["Source-to-target mapping","Transformation logic","Data flow visualization","Impact analysis","All of the above"]',
    '[4]',
    'Data Integration and Interoperability',
    'Please refer to page 285 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 8: Data Integration and Interoperability',
    6,
    'Real-time data integration requires:',
    'multi-select',
    '["Change data capture (CDC)","Message queuing systems","Event-driven architecture","Stream processing","All of the above"]',
    '[4]',
    'Data Integration and Interoperability',
    'Please refer to page 290 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 8: Data Integration and Interoperability',
    7,
    'Data service architecture benefits include:',
    'multi-select',
    '["Reusability","Loose coupling","Scalability","Agility","All of the above"]',
    '[4]',
    'Data Integration and Interoperability',
    'Please refer to page 295 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 8: Data Integration and Interoperability',
    8,
    'API management for data services includes:',
    'multi-select',
    '["API design and documentation","Security and access control","Performance monitoring","Version management","All of the above"]',
    '[4]',
    'Data Integration and Interoperability',
    'Please refer to page 300 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 8: Data Integration and Interoperability',
    9,
    'Data federation allows:',
    'multiple-choice',
    '["Physical consolidation of data","Virtual integration without moving data","Permanent data storage","Data compression"]',
    '[1]',
    'Data Integration and Interoperability',
    'Please refer to page 305 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 9: Document and Content Management',
    1,
    'Document and content management controls the capture, storage, access, and use of data and information stored outside of databases.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Document and Content Management',
    'Please refer to page 321 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 9: Document and Content Management',
    2,
    'Key components of content management include:',
    'multi-select',
    '["Content creation","Content organization","Content retrieval","Content preservation","All of the above"]',
    '[4]',
    'Document and Content Management',
    'Please refer to page 322 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 10: Reference and Master Data',
    1,
    'Master data represents the critical nouns of a business and can be defined as the consistent and uniform set of identifiers and extended attributes.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 347 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 10: Reference and Master Data',
    2,
    'Types of reference data include:',
    'multi-select',
    '["Code sets","Lookup tables","Valid values","Classification schemes","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 348 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 11: Data Warehousing and Business Intelligence',
    1,
    'A data warehouse is a copy of transaction data specifically structured for query and analysis.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 389 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 11: Data Warehousing and Business Intelligence',
    2,
    'Key characteristics of a data warehouse include:',
    'multi-select',
    '["Subject-oriented","Integrated","Time-variant","Non-volatile","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 390 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 12: Metadata Management',
    1,
    'Metadata is data about data. It describes the characteristics of data and provides context that makes data meaningful.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 431 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 12: Metadata Management',
    2,
    'Types of metadata include:',
    'multi-select',
    '["Technical metadata","Business metadata","Process metadata","Operational metadata","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 432 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 13: Data Quality',
    1,
    'Data quality refers to the state of qualitative or quantitative pieces of information.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 467 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 13: Data Quality',
    2,
    'Common data quality dimensions include:',
    'multi-select',
    '["Completeness","Uniqueness","Timeliness","Validity","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 468 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 14: Big Data and Data Science',
    1,
    'Big data is characterized by the three Vs: Volume, Velocity, and Variety.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 515 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 14: Big Data and Data Science',
    2,
    'Data science activities include:',
    'multi-select',
    '["Data exploration","Model development","Model validation","Model deployment","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 520 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 15: Data Management Maturity Assessment',
    1,
    'Data management maturity assessment helps organizations understand their current data management capabilities and identify areas for improvement.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 559 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 15: Data Management Maturity Assessment',
    2,
    'Maturity models typically include levels such as:',
    'multi-select',
    '["Initial","Developing","Defined","Managed","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 560 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 16: Data Management Organization and Role Expectations',
    1,
    'Successful data management requires people with different skills working together in defined roles with clear responsibilities.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 579 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 16: Data Management Organization and Role Expectations',
    2,
    'Key data management roles include:',
    'multi-select',
    '["Data Steward","Data Architect","Database Administrator","Data Analyst","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 580 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 17: Data Management and Organizational Change Management',
    1,
    'Organizational change management is critical for successful data management initiatives.',
    'multiple-choice',
    '["True","False"]',
    '[0]',
    'Data Management',
    'Please refer to page 607 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 17: Data Management and Organizational Change Management',
    2,
    'Key elements of change management include:',
    'multi-select',
    '["Communication","Training","Leadership support","Cultural change","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 608 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 17: Data Management and Organizational Change Management',
    3,
    'Resistance to change in data management initiatives often comes from:',
    'multi-select',
    '["Fear of job loss","Comfort with current processes","Lack of understanding of benefits","Technical complexity","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 610 of DMBOK2.'
);

INSERT INTO questions (chapter, question_number, question_text, question_type, answers, correct_answer, knowledge_area, explanation) VALUES (
    'Chapter 17: Data Management and Organizational Change Management',
    4,
    'Success factors for data management change include:',
    'multi-select',
    '["Executive sponsorship","Clear communication","Adequate training","Phased implementation","All of the above"]',
    '[4]',
    'Data Management',
    'Please refer to page 612 of DMBOK2.'
);

-- Create summary view
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
