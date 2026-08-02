-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 02, 2026 at 09:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `E-Learnify`
--

-- --------------------------------------------------------

--
-- Table structure for table `Courses`
--

CREATE TABLE `Courses` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Icon` varchar(255) NOT NULL,
  `pdf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Courses`
--

INSERT INTO `Courses` (`ID`, `Title`, `Description`, `Icon`, `pdf`) VALUES
(1, 'web', 'Learn HTML, CSS, php and JavaScript\r\n', 'WD', 'pdf/web'),
(2, 'Data science', 'Master python, learn machine learning', 'DS', 'pdf/Data Science'),
(3, 'Artificial Intelligence ', 'Analyze data with Python, R, and powerful libraries.', 'AI', 'pdf/AI'),
(4, 'C language ', 'New powerful modules of C language and their algorithms.', 'C', 'pdf/C language'),
(5, 'CPP language', 'New powerful modules of C++ language and their algorithms.', 'CPP', 'pdf/CPP'),
(6, 'Java', 'Learn Java programming language and its modules.', 'J', 'pdf/java/'),
(7, 'DBMS', 'Master the fundamentals of database management.', 'DBMS', 'pdf/DBMS'),
(8, 'Operating System', 'Understand the core concepts of operating system.', 'OS', 'pdf/OS'),
(9, 'Computer Networks', 'Understand networking concepts and protocols.', 'CN', 'pdf/Networking'),
(10, 'Computer Graphics', 'Explore rendering and 3D modeling.', 'CG', 'pdf/Computer Graphics'),
(11, 'Software Engineering', 'Discover the principles of software engineering.', 'SE', 'pdf/SE'),
(12, 'Numerical Techniques', 'Learn numerical methods and techniques for solving mathematical problems.', 'NT', 'pdf/NT'),
(13, 'Data Structure', 'Learn data structures in C++ and enhance your problem-solving skills.', 'DSA', 'pdf/Data Structure'),
(14, 'Algorithms', 'Master the art of problem-solving with algorithms and their applications.', 'ADT', 'pdf/Algorithms'),
(15, 'Digital Logic', 'Understand the fundamentals of digital circuits and logic design.', 'DL', 'pdf/Digital Logic'),
(16, 'Discrete Math', 'Understand the fundamentals of Discrete Mathematics including logic, set theory, combinatorics, and graph theory.', 'DM', 'pdf/Discrete Math');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `course` varchar(100) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `course`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(1, 'algorithms', 'Which sorting algorithm has the best average case time complexity?', 'Bubble Sort', 'Merge Sort', 'Selection Sort', 'Insertion Sort', 'b'),
(2, 'algorithms', 'What is the time complexity of Binary Search?', 'O(n)', 'O(log n)', 'O(n log n)', 'O(1)', 'b'),
(3, 'algorithms', 'Which algorithm is used to find the shortest path in a weighted graph?', 'DFS', 'Dijkstra\'s Algorithm', 'BFS', 'Prim\'s Algorithm', 'b'),
(4, 'java', 'Which keyword is used to inherit a class in Java?', 'this', 'super', 'extends', 'implements', 'c'),
(5, 'java', 'Which collection class allows you to grow or shrink its size?', 'Array', 'ArrayList', 'HashMap', 'TreeMap', 'b'),
(6, 'Algorithms', 'Which of the following algorithms is used for cycle detection in a graph?', 'Prim’s Algorithm', 'Kruskal’s Algorithm', 'Floyd-Warshall Algorithm', 'Bellman-Ford Algorithm', 'B'),
(7, 'Algorithms', 'Which sorting algorithm is the most efficient for nearly sorted data?', 'Bubble Sort', 'Merge Sort', 'Insertion Sort', 'Quick Sort', 'C'),
(8, 'java', 'What is the size of an int data type in Java?', '2 bytes', '4 bytes', '8 bytes', 'Depends on system architecture', 'b'),
(9, 'java', 'Which of the following is not a feature of Java?', 'Object-Oriented', 'Portable', 'Uses Pointers', 'Platform-Independent', 'c'),
(10, 'java', 'Which keyword is used to inherit a class in Java?', 'implements', 'extends', 'inherits', 'interface', 'b'),
(11, 'Data science', 'Which of the following is a supervised learning algorithm?', 'K-Means', 'Linear Regression', 'Apriori', 'PCA', 'b'),
(12, 'Data science', 'What does the term “overfitting” refer to?', 'Model performs well on training but poorly on test data', 'Model performs well on both training and test data', 'Model performs poorly on both training and test data', 'None of the above', 'a'),
(13, 'Data science', 'Which library is commonly used for data manipulation in Python?', 'NumPy', 'Pandas', 'Matplotlib', 'Scikit-learn', 'b'),
(14, 'Data science', 'What is the primary goal of Principal Component Analysis (PCA)?', 'Increase data dimensionality', 'Reduce data dimensionality', 'Perform classification', 'Perform clustering', 'b'),
(15, 'Data science', 'Which metric is best for evaluating a classification model with imbalanced classes?', 'Accuracy', 'Precision-Recall', 'Mean Squared Error', 'R-squared', 'b'),
(16, 'Artificial Intelligence', 'Who is known as the father of Artificial Intelligence?', 'Alan Turing', 'John McCarthy', 'Marvin Minsky', 'Geoffrey Hinton', 'b'),
(17, 'Artificial Intelligence', 'What is the main goal of Artificial Intelligence?', 'To increase internet speed', 'To solve tasks that require human intelligence', 'To build faster hardware', 'To replace all software engineers', 'b'),
(18, 'Artificial Intelligence', 'Which of the following is an example of reinforcement learning?', 'Decision Trees', 'Q-Learning', 'Naive Bayes', 'Linear Regression', 'b'),
(19, 'Artificial Intelligence', 'Which algorithm is commonly used in natural language processing?', 'K-Means Clustering', 'Convolutional Neural Networks (CNNs)', 'Recurrent Neural Networks (RNNs)', 'Apriori Algorithm', 'c'),
(20, 'Artificial Intelligence', 'Which of the following best describes a neural network?', 'A rule-based expert system', 'A set of interconnected nodes inspired by the human brain', 'A type of database', 'A spreadsheet with formulas', 'b'),
(21, 'C language', 'Which of the following is a correct declaration in C?', 'int number;', 'int number(())', 'int number[]:', 'int number:', 'a'),
(22, 'C language', 'Which symbol is used to declare a pointer in C?', '*', '&', '%', '#', 'a'),
(23, 'C language', 'What is the output of printf(\"%d\", 10/4);', '2.5', '2', '2.0', 'Error', 'b'),
(24, 'C language', 'Which of the following is a valid keyword in C?', 'default', 'finally', 'class', 'interface', 'a'),
(25, 'C language', 'Which header file is required for using printf() and scanf()?', 'stdio.h', 'conio.h', 'stdlib.h', 'math.h', 'a'),
(26, 'CPP language', 'Which of the following is the correct way to declare a class in C++?', 'class MyClass {};', 'MyClass class {};', 'class: MyClass {};', 'Class MyClass {};', 'a'),
(27, 'CPP langauge', 'Which concept allows using the same function name with different parameters in C++?', 'Inheritance', 'Encapsulation', 'Polymorphism', 'Function overloading', 'd'),
(28, 'CPP language', 'What is the use of the new keyword in C++?', 'To declare a new variable', 'To allocate memory dynamically', 'To define a new class', 'To include a new library', 'b'),
(29, 'CPP language', 'Which of the following is used to release memory allocated using new?', 'free', 'delete', 'remove', 'dispose', 'b'),
(30, 'CPP langauge', 'Which of the following is not a feature of C++?', 'Object-oriented programming', 'Operator overloading', 'Garbage collection', 'Inheritance', 'c'),
(31, 'DBMS', 'Which of the following is a feature of DBMS?', 'Data redundancy increase', 'Data integrity', 'Data inconsistency', 'Program-data dependence', 'b'),
(32, 'DBMS', 'Which normal form eliminates transitive dependency?', '1NF', '2NF', '3NF', 'BCNF', 'c'),
(33, 'DBMS', 'What does SQL stand for?', 'Structured Query Language', 'Simple Query Language', 'Sequential Query Language', 'Standard Query Language', 'a'),
(34, 'DBMS', 'Which of the following is a DML command?', 'CREATE', 'SELECT', 'DROP', 'ALTER', 'b'),
(35, 'DBMS', 'What is the purpose of a primary key in a database?', 'To allow duplicate values', 'To uniquely identify each record', 'To create foreign keys', 'To sort records automatically', 'b'),
(36, 'Operating System', 'Which of the following is not a type of operating system?', 'Batch Operating System', 'Time-Sharing Operating System', 'Compiler Operating System', 'Real-Time Operating System', 'c'),
(37, 'Operating System', 'Which scheduling algorithm is also known as shortest-job-next?', 'FCFS', 'SJF', 'RR', 'Priority Scheduling', 'b'),
(38, 'Operating System', 'What is a critical section in process synchronization?', 'Part of program where process is blocked', 'Part of program accessing shared resources', 'Part of kernel code', 'Section that runs without interrupts', 'b'),
(39, 'Operating System', 'Which of the following is used to avoid deadlock?', 'Mutual Exclusion', 'Hold and Wait', 'Banker\'s Algorithm', 'Circular Wait', 'c'),
(40, 'Operating System', 'In paging, the address generated by CPU is called:', 'Logical address', 'Physical address', 'Virtual address', 'Frame address', 'a'),
(41, 'Computer Networks', 'Which of the following is a data link layer protocol?', 'IP', 'TCP', 'Ethernet', 'HTTP', 'c'),
(42, 'Computer Networks', 'Which device operates at the network layer?', 'Switch', 'Router', 'Hub', 'Repeater', 'b'),
(43, 'Computer Networks', 'What is the main purpose of DNS?', 'Encrypt data', 'Assign IP addresses', 'Translate domain names to IP addresses', 'Manage MAC addresses', 'c'),
(44, 'Computer Networks', 'Which of the following is a connection-oriented protocol?', 'UDP', 'IP', 'TCP', 'ICMP', 'c'),
(45, 'Computer Networks', 'In the OSI model, the transport layer is responsible for:', 'Addressing', 'Routing', 'Flow and error control', 'Physical transmission', 'c'),
(46, 'Computer Graphics', 'Which of the following algorithms is used for line drawing?', 'DDA algorithm', 'Bresenham’s algorithm', 'Both a and b', 'Cohen-Sutherland algorithm', 'c'),
(47, 'Computer Graphics', 'Which of the following is used for clipping lines?', 'Liang-Barsky algorithm', 'Cohen-Sutherland algorithm', 'Both a and b', 'DDA algorithm', 'c'),
(48, 'Computer Graphics', 'What is the purpose of the Z-buffer algorithm?', 'Line drawing', 'Hidden surface removal', 'Shading', 'Scan conversion', 'b'),
(49, 'Computer Graphics', 'Which of the following is NOT a type of projection?', 'Orthographic projection', 'Perspective projection', 'Parallel projection', 'Reflective projection', 'd'),
(50, 'Computer Graphics', 'In computer graphics, transformations are used to:', 'Modify shapes and positions', 'Encrypt data', 'Compress images', 'Allocate memory', 'a'),
(51, 'Software Engineering', 'Which of the following is not a software process model?', 'Waterfall model', 'Spiral model', 'V-Model', 'Gradient model', 'd'),
(52, 'Software Engineering', 'In software engineering, SRS stands for:', 'Software Requirement Specification', 'System Resource Software', 'Software Review System', 'System Requirement Solution', 'a'),
(53, 'Software Engineering', 'Which of the following is a type of software maintenance?', 'Corrective', 'Adaptive', 'Perfective', 'All of the above', 'd'),
(54, 'Software Engineering', 'Which one is a risk management technique?', 'Risk identification', 'Risk analysis', 'Risk planning', 'All of the above', 'd'),
(55, 'Software Engineering', 'Agile software development emphasizes:', 'Comprehensive documentation', 'Following a strict plan', 'Customer collaboration and flexibility', 'Avoiding customer involvement', 'c'),
(56, 'Numerical Techniques', 'Which of the following is a root-finding method?', 'Bisection method', 'Euler’s method', 'Gauss-Seidel method', 'Trapezoidal rule', 'a'),
(57, 'Numerical Techniques', 'The Newton-Raphson method is used to:', 'Solve differential equations', 'Find roots of nonlinear equations', 'Perform numerical integration', 'Solve linear systems', 'b'),
(58, 'Numerical Techniques', 'Which of the following methods is used for numerical integration?', 'Euler’s method', 'Simpson’s 1/3 rule', 'Gauss elimination', 'Jacobi method', 'b'),
(59, 'Numerical Techniques', 'Which method is used to solve ordinary differential equations?', 'Bisection method', 'Runge-Kutta method', 'Gauss-Jordan method', 'Newton’s forward method', 'b'),
(60, 'Numerical Techniques', 'The Gauss-Seidel method is used to:', 'Solve systems of linear equations', 'Perform numerical differentiation', 'Find eigenvalues', 'Integrate definite integrals', 'a'),
(61, 'Data Structure', 'Which data structure uses FIFO (First In, First Out) principle?', 'Stack', 'Queue', 'Tree', 'Graph', 'b'),
(62, 'Data Structure', 'Which of the following is used to implement recursion?', 'Queue', 'Stack', 'Linked list', 'Array', 'b'),
(63, 'Data Structure', 'Which data structure is best for implementing a priority queue?', 'Stack', 'Array', 'Heap', 'Linked list', 'c'),
(64, 'Data Structure', 'What is the time complexity of binary search on a sorted array?', 'O(n)', 'O(log n)', 'O(n log n)', 'O(1)', 'b'),
(65, 'Data Structure', 'Which traversal technique is used in breadth-first search (BFS) of a graph?', 'Stack', 'Queue', 'Recursion', 'Heap', 'b'),
(66, 'Digital Logic', 'Which of the following is a universal gate?', 'AND', 'OR', 'NAND', 'NOT', 'c'),
(67, 'Digital Logic', 'How many flip-flops are needed to store one byte of data?', '4', '8', '16', '32', 'b'),
(68, 'Digital Logic', 'What is the binary equivalent of the decimal number 13?', '1101', '1011', '1110', '1001', 'a'),
(69, 'Digital Logic', 'Which of the following is a combinational circuit?', 'Flip-flop', 'Counter', 'Multiplexer', 'Shift register', 'c'),
(70, 'Digital Logic', 'In a JK flip-flop, when both J and K are set to 1, what is the output?', 'Set', 'Reset', 'Toggle', 'No change', 'c'),
(71, 'Discrete Math', 'Which of the following is a valid set operation?', 'Union', 'Intersection', 'Complement', 'All of the above', 'd'),
(72, 'Discrete Math', 'What is the cardinality of the set {1, 2, 3, 4, 5}?', '4', '5', '6', '10', 'b'),
(73, 'Discrete Math', 'Which of the following statements is true for a function to be injective?', 'Every element in the codomain has a unique preimage', 'Every element in the domain has a unique image', 'The function has at least one inverse', 'The function is surjective', 'a'),
(74, 'Discrete Math', 'In a directed graph, what does an edge with no tail represent?', 'A self-loop', 'A source vertex', 'A sink vertex', 'A disconnected graph', 'b'),
(75, 'Discrete Math', 'Which of the following is an example of a tautology?', 'p ∧ ¬p', 'p ∨ ¬p', 'p → q', 'p ↔ q', 'b'),
(76, 'web', 'Which HTML tag is used to define an external JavaScript file?', '<script>', '<link>', '<style>', '<javascript>', 'a'),
(77, 'web', 'What is the correct HTML tag to insert an image?', '<image src=\"path\">', '<img src=\"path\">', '<src=\"path\" img>', '<image-path=\"path\">', 'b'),
(78, 'web', 'What does the CSS property \"display: flex\" do?', 'Centers content', 'Displays content in a grid', 'Arranges content in a flexible layout', 'Changes text color', 'c'),
(79, 'web', 'Which of the following is used to declare a variable in JavaScript?', 'var', 'let', 'const', 'All of the above', 'd'),
(80, 'web', 'Which PHP function is used to include a file into a PHP script?', 'include()', 'require()', 'import()', 'include_file()', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_pic` varchar(255) DEFAULT NULL,
  `register_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `created_at`, `profile_pic`, `register_date`) VALUES
(1, '', '', 'djkew@ehv.cids', '$2y$10$v4O3V16C/Ke1181YV75naeKqRPOe3BrNjOpfAqZYp2zRaCRJMSCtC', '2025-04-28 16:42:37', NULL, '2025-05-05 02:54:42'),
(2, '$firstName', '$lastName', '$email', '$hashedPassword', '2025-04-29 05:37:31', NULL, '2025-05-05 02:54:42'),
(3, 'Hritik', 'Jena', 'hritikjn6@gmail.com', '$2y$10$Lsl4HIr.8oJ/M4Vm7kJX4OY0Y0KgbqIg8YvN.9I4u.ZkkvnbhqcyO', '2025-05-04 07:24:06', 'Screenshot 2025-05-06 at 6.04.40 PM.png', '2025-05-05 02:54:42'),
(4, 'Akash', 'Sahoo', 'akash123@gmail.com', '$2y$10$9TDh0qsl5AO5LysJp3uQ3ulq6Ic0KchYzEmxGIhz4z/0bNIU6UMI.', '2025-05-04 19:59:49', 'uploads/FACE IMAGE.jpeg', '2025-05-05 02:54:42'),
(6, 'zzz', 'zz', 'zz@gmail.com', '$2y$10$IbnVF8omkiqSvjqxEYa4Peg0ke5FlVzqTG8M.L1qtYVH2sIPQw6Zm', '2025-05-06 05:15:11', '45d7577b4c8b12961e60aa91f8963bb7.jpg', '2025-05-06 10:45:11'),
(7, 'ss', 'ss', 's@gmail.com', '$2y$10$tvt2xjK8ixlOcPpGn04fAuV89bx6zL85u2fskwC1R68eCRLfNzHp2', '2025-05-06 05:34:41', NULL, '2025-05-06 11:04:41'),
(8, 'aaa', 'aaa', 'a@GMAIL.COM', '$2y$10$nKhdrawSaJj6y7nNgmGeIeVZ7ZDHzHsf2iIWSQnRbb62iqZJ8cNsm', '2025-05-06 06:36:58', NULL, '2025-05-06 12:06:58'),
(9, 'XX', 'XX', 'X@GMAIL.COM', '$2y$10$3Ru99Ks/ay71FRUa6YRtmuNuAmFxAt0607KzPVTwdJcDY.FjL4iO2', '2025-05-06 13:14:09', NULL, '2025-05-06 18:44:09'),
(10, 'dd', 'dd', 'd@gmail.com', '$2y$10$6GmWrT9Z6fVjvCiOGZqbDexpysX1y5ti0lDmHLOIYQ8YwpyoHBbl2', '2025-05-07 05:57:41', NULL, '2025-05-07 11:27:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Courses`
--
ALTER TABLE `Courses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Courses`
--
ALTER TABLE `Courses`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
