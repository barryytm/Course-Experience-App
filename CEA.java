package com.cea;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.table.*;
import java.sql.*;
import java.awt.*;
import java.awt.event.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

public class CEA extends JFrame {
    public static final String PROGRAM_NAME = "CEA";
    int numCols, numRows;
    Connection connection;

    // GUI components
    JTable table;

    JLabel label_USERNAME;
    JLabel label_DEPT_CODE;
    JLabel label_COURSE_NUM;
    JLabel label_START_DATE;
    JLabel label_SECTION_ID;
    JLabel label_GRADE;
    JLabel label_SATISFACTION;
    JLabel label_RANK_OF_INSTRUCTOR;
    JLabel label_START_INTEREST;
    JLabel label_END_INTEREST;
    
    JTextField textField_USERNAME;
    JTextField textField_DEPT_CODE;
    JTextField textField_COURSE_NUM;
    JTextField textField_START_DATE;
    JTextField textField_SECTION_ID;
    JTextField textField_GRADE;
    JTextField textField_SATISFACTION;
    JTextField textField_RANK_OF_INSTRUCTOR;
    JTextField textField_label_START_INTEREST;
    JTextField textField_END_INTEREST;

    JButton button_ADD_EXPERIENCE;

    Object[] columnNames = {"Username", "Dept_Code", "Course_Num", "Start_Date",
    "Section_Id", "Grade", "Satisfaction", "Rank_Of_Instructor", 
    "Start_Interest", "End_Interest"};

    public CEA(Connection conn) throws SQLException {
        super("Course Experience App");

        this.connection = conn;

        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                DBConnection.closeConnection(connection);
                System.exit(0);
            }
        });

        table - new JTable();
        refreshTabel();

        // setting up new components
        label_USERNAME = new JLabel("Username:");
        label_DEPT_CODE = new JLabel("Dept_Code:");
        label_COURSE_NUM = new JLabel("Course_Num:");
        label_START_DATE = new JLabel("Start_Date:");
        label_SECTION_ID = new JLabel("Section_Id:");
        label_GRADE = new JLabel("Grade:");
        label_SATISFACTION = new JLabel("Satisfaction:");
        label_RANK_OF_INSTRUCTOR = new JLabel("Rank_Of_Instructor:");
        label_START_INTEREST = new JLabel("Start_Interest:");
        label_END_INTEREST = new JLabel("End_Interest:");

        textField_USERNAME = new JTextField(10);
        textField_DEPT_CODE = new JTextField(10);
        textField_COURSE_NUM = new JTextField(10);
        textField_START_DATE = new JTextField(10);
        textField_SECTION_ID = new JTextField(10);
        textField_GRADE = new JTextField(10);
        textField_SATISFACTION = new JTextField(10);
        textField_RANK_OF_INSTRUCTOR = new JTextField(10);
        textField_label_START_INTEREST = new JTextField(10);
        textField_END_INTEREST = new JTextField(10);

        JButton button_ADD_EXPERIENCE = new JButton("Add Experience");
    }
}