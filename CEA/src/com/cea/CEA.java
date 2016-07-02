package com.cea;

import javax.swing.*;
import javax.swing.table.*;
import java.sql.*;
import java.awt.*;
import java.awt.event.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

@SuppressWarnings("serial")
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
    JLabel label_SKILL;
    JLabel label_START_LEVEL;
    JLabel label_END_LEVEL;
    
    JTextField textField_USERNAME;
    JTextField textField_DEPT_CODE;
    JTextField textField_COURSE_NUM;
    JTextField textField_START_DATE;
    JTextField textField_SECTION_ID;
    JTextField textField_GRADE;
    JTextField textField_SATISFACTION;
    JTextField textField_RANK_OF_INSTRUCTOR;
    JTextField textField_START_INTEREST;
    JTextField textField_END_INTEREST;
    JTextField textField_SKILL;
    JTextField textField_START_LEVEL;
    JTextField textField_END_LEVEL;

    JButton button_ADD_EXPERIENCE;

    Object[] columnNames = {"Username", "Dept_Code", "Course_Num", "Start_Date",
    "Section_Id", "Grade", "Satisfaction", "Rank_Of_Instructor", 
    "Start_Interest", "End_Interest", "Skill", "Start_Level", "End_Level"};

    public CEA(Connection conn) throws SQLException {
        super("Course Experience App");

        this.connection = conn;

        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                DBConnection.closeConnection(connection);
                System.exit(0);
            }
        });

        table = new JTable();
        refreshTable();

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
        label_SKILL = new JLabel("Skill:");
        label_START_LEVEL = new JLabel("Start_Level:");
        label_END_LEVEL = new JLabel("End_Level:");

        textField_USERNAME = new JTextField(10);
        textField_DEPT_CODE = new JTextField(10);
        textField_COURSE_NUM = new JTextField(10);
        textField_START_DATE = new JTextField(10);
        textField_SECTION_ID = new JTextField(10);
        textField_GRADE = new JTextField(10);
        textField_SATISFACTION = new JTextField(10);
        textField_RANK_OF_INSTRUCTOR = new JTextField(10);
        textField_START_INTEREST = new JTextField(10);
        textField_END_INTEREST = new JTextField(10);
        textField_SKILL = new JTextField(10);
        textField_START_LEVEL = new JTextField(10);
        textField_END_LEVEL = new JTextField(10);

        JButton button_ADD_EXPERIENCE = new JButton("Add Experience");

        Container contentPane = getContentPane();
        contentPane.setComponentOrientation(ComponentOrientation.LEFT_TO_RIGHT);
        contentPane.setLayout(new GridBagLayout());
        GridBagConstraints c = new GridBagConstraints();

        c.fill = GridBagConstraints.BOTH;
        c.anchor = GridBagConstraints.CENTER;
        c.weightx = 0.5;
        c.weighty = 1.0;
        c.gridx = 0;
        c.gridy = 0;
        c.gridwidth = 4;
        contentPane.add(new JScrollPane(table), c);
        
        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 0;
        c.gridy = 1;
        c.gridwidth = 1;
        contentPane.add(label_USERNAME, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 1;
        c.gridy = 1;
        c.gridwidth = 1;
        contentPane.add(textField_USERNAME, c);
               
        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 2;
        c.gridy = 1;
        c.gridwidth = 1;
        contentPane.add(label_DEPT_CODE, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 3;
        c.gridy = 1;
        c.gridwidth = 1;
        contentPane.add(textField_DEPT_CODE, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 0;
        c.gridy = 3;
        c.gridwidth = 1;
        contentPane.add(label_COURSE_NUM, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 1;
        c.gridy = 3;
        c.gridwidth = 1;
        contentPane.add(textField_COURSE_NUM, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 2;
        c.gridy = 3;
        c.gridwidth = 1;
        contentPane.add(label_START_DATE, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 3;
        c.gridy = 3;
        c.gridwidth = 1;
        contentPane.add(textField_START_DATE, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 0;
        c.gridy = 4;
        c.gridwidth = 1;
        contentPane.add(label_SECTION_ID, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 1;
        c.gridy = 4;
        c.gridwidth = 1;
        contentPane.add(textField_SECTION_ID, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 2;
        c.gridy = 4;
        c.gridwidth = 1;
        contentPane.add(label_SATISFACTION, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 3;
        c.gridy = 4;
        c.gridwidth = 1;
        contentPane.add(textField_SATISFACTION, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.weightx = 0.25;
        c.weighty = 0;
        c.anchor = GridBagConstraints.LINE_START;
        c.gridx = 0;
        c.gridy = 5;
        c.gridwidth = 1;
        contentPane.add(label_RANK_OF_INSTRUCTOR, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 1;
        c.gridy = 5;
        c.gridwidth = 1;
        contentPane.add(textField_RANK_OF_INSTRUCTOR, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 2;
        c.gridy = 5;
        c.gridwidth = 1;
        contentPane.add(label_START_INTEREST, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 3;
        c.gridy = 5;
        c.gridwidth = 1;
        contentPane.add(textField_START_INTEREST, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 0;
        c.gridy = 6;
        c.gridwidth = 1;
        contentPane.add(label_END_INTEREST, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 1;
        c.gridy = 6;
        c.gridwidth = 1;
        contentPane.add(textField_END_INTEREST, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 2;
        c.gridy = 6;
        c.gridwidth = 1;
        contentPane.add(label_SKILL, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 3;
        c.gridy = 6;
        c.gridwidth = 1;
        contentPane.add(textField_SKILL, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 0;
        c.gridy = 7;
        c.gridwidth = 1;
        contentPane.add(label_START_LEVEL, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 1;
        c.gridy = 7;
        c.gridwidth = 1;
        contentPane.add(textField_START_LEVEL, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.25;
        c.weighty = 0;
        c.gridx = 2;
        c.gridy = 7;
        c.gridwidth = 1;
        contentPane.add(label_END_LEVEL, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_END;
        c.weightx = 0.75;
        c.weighty = 0;
        c.gridx = 3;
        c.gridy = 7;
        c.gridwidth = 1;
        contentPane.add(textField_END_LEVEL, c);

        c.fill = GridBagConstraints.HORIZONTAL;
        c.anchor = GridBagConstraints.LINE_START;
        c.weightx = 0.5;
        c.weighty = 0;
        c.gridx = 0;
        c.gridy = 8;
        c.gridwidth = 4;
        contentPane.add(button_ADD_EXPERIENCE, c);

        button_ADD_EXPERIENCE.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                Experience exp = new Experience();

                exp.setUsername(textField_USERNAME.getText());
                exp.setDeptCode(textField_DEPT_CODE.getText());
                exp.setCourseNum(textField_COURSE_NUM.getText());
                exp.setStartDate(textField_START_DATE.getText());
                exp.setSectionId(textField_SECTION_ID.getText());

                exp.setSatisfaction(textField_SATISFACTION.getText());
                exp.setRankOfInstructor(textField_RANK_OF_INSTRUCTOR.getText());
                exp.setStartInterest(textField_START_INTEREST.getText());
                exp.setEndInterest(textField_END_INTEREST.getText());
                exp.setSkill(textField_SKILL.getText());
                exp.setStartLevel(textField_START_LEVEL.getText());
                exp.setEndLevel(textField_END_LEVEL.getText());

                try {
                    exp.addExperienceToDB(connection);
                    clearInputs();
                    refreshTable();
                } catch (SQLException ex) {
                    SQLError.show(ex);
                }
            }
        });
    }

    private void clearInputs() {
        textField_USERNAME.setText("");
        textField_DEPT_CODE.setText("");
        textField_COURSE_NUM.setText("");
        textField_START_DATE.setText("");
        textField_SECTION_ID.setText("");
        textField_GRADE.setText("");
        textField_SATISFACTION.setText("");
        textField_RANK_OF_INSTRUCTOR.setText("");
        textField_START_INTEREST.setText("");
        textField_END_INTEREST.setText("");
        textField_SKILL.setText("");
        textField_START_LEVEL.setText("");
        textField_END_LEVEL.setText("");
    }

    private void refreshTable() {
        try {
            DefaultTableModel model = new DefaultTableModel(new Object[0][0], columnNames);
            java.util.List<Experience> experiences = Experience.getAllExperiences(connection);
            
            for (Experience exp : experiences) {
                Object[] obj = new Object[13];

                obj[0] = exp.getUsername();
                obj[1] = exp.getDeptCode();
                obj[2] = exp.getCourseNum();
                obj[3] = exp.getStartDate();
                obj[4] = exp.getSectionId();
                obj[5] = exp.getGrade();
                obj[6] = exp.getSatisfaction();
                obj[7] = exp.getRankOfInstructor();
                obj[8] = exp.getStartInterest();
                obj[9] = exp.getEndInterest();
                obj[10] = exp.getSkill();
                obj[11] = exp.getStartLevel();
                obj[12] = exp.getEndLevel();

                model.addRow(obj);
            }

            table.setModel(model);
            table.repaint();
        } catch (SQLException ex) {
            SQLError.show(ex);
        }
    }
    
    public static void printTable(Connection conn) throws SQLException {
		Statement stmt = null;
	    String query = "select e.dept_code, e.start_date, sec.end_date, time_of_day, enrol_num, " +
	    		 		"e.username, e.grade, 2016-stu.birth_year, stu.birth_year, stu.birth_month, stu.gender, stu.birth_country, stu.enrol_year, stu.enrol_month, e.satisfaction, rank_of_instructor " +
	    				"from experience as e, sections as sec, students as stu," +
	    					"(select dept_code, course_num, start_date, section_id, end_date, time_of_day, enrol_num," +
	    					"array_to_string(array_agg(distinct instructor_name), '|') as ins " +
	    					"from sections as sec " +
	    					"group by dept_code, course_num, start_date, section_id) " +
	    				"where e.dept_code = sec.dept_code and " +
	    				"e.course_num = sec.course_num and " +
	    				"e.username = stu.username";
	   
	    try {
	        stmt = conn.createStatement();
	        ResultSet rs = stmt.executeQuery(query);
	        int cols = rs.getMetaData().getColumnCount();
	        while (rs.next()) {
	        	for (int i=0; i< cols; i++) {
	        		Object str = rs.getObject(i+1);
	        		if (i < cols - 1) {
	        			str += ",";
	        		}
        			System.out.print(str);
	        	}
	        		
	        	System.out.print("\n");	           
	        }
	    } catch (SQLException e ) {
	    	SQLError.show(e);
	       // JDBCTutorialUtilities.printSQLException(e);
	    } finally {
	        if (stmt != null) { stmt.close(); }
	    }
    }

    public static void main(String[] args) throws IOException, SQLException {
        if (args.length == 0) {
            System.out.println("Usage: " + PROGRAM_NAME + "<name of property file>");
            System.exit(1);
        }

        Properties props = new Properties();
        FileInputStream in = new FileInputStream(args[0]);
        props.load(in);
        in.close();

        java.sql.Connection conn = DBConnection.getConnection(props);

        if (conn == null) {
            System.exit(1);
        }
        
        printTable(conn);
	    
//        CEA cea = new CEA(conn);
//
//        cea.pack();
//        cea.setVisible(true);
    }
}