-- Table for User
CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    jobTitle VARCHAR(255),
    position VARCHAR(255),
    role ENUM ('HoD', 'Supervisor', 'Employee') NOT NULL,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(id)
);

-- Table for Department
CREATE TABLE Department (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    hodId INT,
    FOREIGN KEY (hodId) REFERENCES User(id)
);

-- Table for DepartmentObjective
CREATE TABLE DepartmentObjective (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    weight FLOAT NOT NULL,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(id)
);

-- Table for KPI
CREATE TABLE KPI (
    id INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    name VARCHAR(255) NOT NULL,
    metric VARCHAR(255),
    unit VARCHAR(255),
    score FLOAT,
    FOREIGN KEY (userId) REFERENCES User(id)
);

-- Table for SupervisorGrade
CREATE TABLE SupervisorGrade (
    supervisorId INT,
    kpiId INT,
    grade FLOAT NOT NULL,
    PRIMARY KEY (supervisorId, kpiId),
    FOREIGN KEY (supervisorId) REFERENCES User(id),
    FOREIGN KEY (kpiId) REFERENCES KPI(id)
);

-- Table for EmployeeSupervisorFeedback
CREATE TABLE EmployeeSupervisorFeedback (
    employeeId INT,
    supervisorId INT,
    grade FLOAT NOT NULL,
    feedback TEXT,
    PRIMARY KEY (employeeId, supervisorId),
    FOREIGN KEY (employeeId) REFERENCES User(id),
    FOREIGN KEY (supervisorId) REFERENCES User(id)
);
