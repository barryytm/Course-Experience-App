package com.cea;

import java.sql.*;
import java.util.*;

public class Experience {
    private String username;
    private String deptCode;
    private String courseNum;
    private String startDate;
    private String sectionId;
    private String grade;
    private String satisfaction;
    private String rankOfInstructor;
    private String topic;
    private String startInterest;
    private String endInterest;
    private String skill;
    private String startLevel;
    private String endLevel;

    private String updateSQL1 = "UPDATE experience " +
                                "SET satisfaction = ?," +
                                "rank_of_instructor = ? " +
                                "WHERE username = ? AND " +
                                "dept_code = ? AND " +
                                "course_num = ? AND " +
                                "start_date = ? AND " +
                                "section_id = ?";

    private String updateSQL2 = "UPDATE course_skills " +
                                "SET start_level = ?," +
                                "end_level = ? " +
                                "WHERE username = ? AND " +
                                "dept_code = ? AND " +
                                "course_num = ? AND " +
                                "start_date = ? AND " +
                                "section_id = ? AND " +
                                "skill = ?";
    
    private static String updateSQL3 = "UPDATE course_topics " +
    								   "SET start_interest = ?," +
    								   "end_interest = ? " +
    								   "WHERE username = ? AND " +
    	                               "dept_code = ? AND " +
    	                               "course_num = ? AND " +
    	                               "start_date = ? AND " +
    	                               "section_id = ? AND " +
    	                               "topic = ?";

    private static String selectSQL = "SELECT experience.username," +
                                        "experience.dept_code," +
                                        "experience.course_num," +
                                        "experience.start_date," +
                                        "experience.section_id," +
                                        "satisfaction," +
                                        "grade," +
                                        "rank_of_instructor," +
                                        "topic, " +
                                        "start_interest," +
                                        "end_interest," +
                                        "skill," +
                                        "start_level," +
                                        "end_level " +
                                        "FROM experience natural join course_skills natural join course_topics";
    
    

    PreparedStatement stmt1 = null;
    PreparedStatement stmt2 = null;
    PreparedStatement stmt3 = null; 

    public void addExperienceToDB(Connection conn) throws SQLException {
		if (!this.validate()){
			System.out.println("Experience fields not set");
			System.exit(1);
		}

        try {
            conn.setAutoCommit(false);

            stmt1 = conn.prepareStatement(updateSQL1);
            stmt1.setString(1, this.satisfaction);
            stmt1.setString(2, this.rankOfInstructor);
            stmt1.setString(3, this.username);
            stmt1.setString(4, this.deptCode);
            stmt1.setString(5, this.courseNum);
            stmt1.setString(6, this.startDate);
            stmt1.setString(7, this.sectionId);

            stmt2 = conn.prepareStatement(updateSQL2);
            stmt2.setString(1, this.startLevel);
            stmt2.setString(2, this.endLevel);
            stmt2.setString(3, this.username);
            stmt2.setString(4, this.deptCode);
            stmt2.setString(5, this.courseNum);
            stmt2.setString(6, this.startDate);
            stmt2.setString(7, this.sectionId);
            stmt2.setString(8, this.skill);
            
            stmt3 = conn.prepareStatement(updateSQL3);
            stmt3.setString(1, this.startInterest);
            stmt3.setString(2, this.endInterest);
            stmt3.setString(3, this.username);
            stmt3.setString(4, this.deptCode);
            stmt3.setString(5, this.courseNum);
            stmt3.setString(6, this.startDate);
            stmt3.setString(7, this.sectionId);
            stmt3.setString(8, this.topic);

            stmt1.execute();
            stmt2.execute();
            stmt3.execute();

            conn.commit();

        } catch (SQLException e) {
            SQLError.show(e);
        } finally {
			if (stmt1 != null) {
				stmt1.close();
			}
			if (stmt2 != null) {
				stmt2.close();
			}
			if (stmt3 != null) {
				stmt3.close();
			}
        }
    }

    public static List<Experience> getAllExperiences(Connection conn) throws SQLException {
        List<Experience> experiences = new ArrayList<Experience>();
        Statement stmt = null;

        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(selectSQL);
            
            while (rs.next()) {
                Experience exp = new Experience();

                exp.setUsername(rs.getString("username"));
                exp.setDeptCode(rs.getString("dept_code"));
                exp.setCourseNum(rs.getString("course_num"));
                exp.setStartDate(rs.getString("start_date"));
                exp.setSectionId(rs.getString("section_id"));
                exp.setGrade(rs.getString("grade"));
                exp.setSatisfaction(rs.getString("satisfaction"));
                exp.setRankOfInstructor(rs.getString("rank_of_instructor"));
                exp.setTopic(rs.getString("topic"));
                exp.setStartInterest(rs.getString("start_interest"));
                exp.setEndInterest(rs.getString("end_interest"));
                exp.setSkill(rs.getString("skill"));
                exp.setStartLevel(rs.getString("start_level"));
                exp.setEndLevel(rs.getString("end_level"));

                experiences.add(exp);
            }
        } catch (SQLException e) {
            SQLError.show(e);
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }

        return experiences;
    }

    private boolean validate () {
		if (this.username == null)
			return false;
		if (this.deptCode == null)
			return false;
		if (this.courseNum == null)
			return false;
        if (this.startDate == null)
			return false;
		if (this.sectionId == null)
			return false;
		return true;
	}

    // getters and setters
    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDeptCode() {
        return this.deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public String getCourseNum() {
        return this.courseNum;
    }

    public void setCourseNum(String courseNum) {
        this.courseNum = courseNum;
    }

    public String getStartDate() {
        return this.startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getSectionId() {
        return this.sectionId;
    }

    public void setSectionId(String sectionId) {
        this.sectionId = sectionId;
    }

    public String getGrade() {
        return this.grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getSatisfaction() {
        return this.satisfaction;
    }

    public void setSatisfaction(String satisfaction) {
        this.satisfaction = satisfaction;
    }

    public String getRankOfInstructor() {
        return this.rankOfInstructor;
    }

    public void setRankOfInstructor(String rankOfInstructor) {
        this.rankOfInstructor = rankOfInstructor;
    }
    
    public String getTopic() {
        return this.topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getStartInterest() {
        return this.startInterest;
    }

    public void setStartInterest(String startInterest) {
        this.startInterest = startInterest;
    }

    public String getEndInterest() {
        return this.endInterest;
    }

    public void setEndInterest(String endInterest) {
        this.endInterest = endInterest;
    }

    public String getSkill() {
        return this.skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getStartLevel() {
        return this.startLevel;
    }

    public void setStartLevel(String startLevel) {
        this.startLevel = startLevel;
    }

    public String getEndLevel() {
        return this.endLevel;
    }

    public void setEndLevel(String endLevel) {
        this.endLevel = endLevel;
    }
}