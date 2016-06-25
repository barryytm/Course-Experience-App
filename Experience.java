package com.cea;

import java.sql.*;
import java.util.*;

public class Experience {
    private String username;
    private String courseNum;
    private String deptCode;
    private String startDate;
    private String sectionId;
    private String grade;
    private String satisfaction;
    private String rankOfInstructor;
    private String startInterest;
    private String endInterest;
    private String skill;
    private String startLevel;
    private String endLevel;

    private String updateSQL1 = "UPDATE TABLE experience" +
                                "SET satisfaction = ?," +
                                "rank_of_instructor = ?," +
                                "start_interest = ?," +
                                "end_interest = ? " +
                                "WHERE username = ? AND " +
                                "dept_code = ? AND " +
                                "course_num = ? AND " +
                                "start_date = ? AND " +
                                "section_id = ?";

    private String updateSQL2 = "UPDATE TABLE course_skills" +
                                "SET skill = ?," +
                                "start_level = ?," +
                                "end_level = ? " +
                                "WHERE username = ? AND " +
                                "dept_code = ? AND " +
                                "course_num = ? AND " +
                                "start_date = ? AND " +
                                "section_id = ?";

    private static String selectSQL = "SELECT experience.username," +
                                        "experience.dept_code," +
                                        "experience.course_num," +
                                        "experience.start_date," +
                                        "experience.section_id," +
                                        "satisfaction," +
                                        "rank_of_instructor," +
                                        "start_interest," +
                                        "end_interest," +
                                        "skill," +
                                        "start_level," +
                                        "end_level " +
                                        "FROM experience, course_skills " +
                                        "WHERE experience.username = course_skills.username AND " +
                                        "experience.dept_code = course_skills.dept_code AND " +
                                        "experience.course_num = course_skills.course_num AND " +
                                        "experience.start_date = course_skills.start_date AND " +
                                        "experience.section_id = course_skills.section_id";

    PreparedStatement stmt1 = null;
    PreparedStatement stmt2 = null;         

    public void addExperienceToDB(Connection conn) throws SQLException {
		if (!this.validate()){
			System.out.println("Experience fields not set");
			System.exit(1);
		}

        try {
            conn.setAutoCommit(false);

            stmt1 = conn.preparedStatement(updateSQL1);
            stmt1.setString(1, this.satisfaction);
            stmt1.setString(2, this.rankOfInstructor);
            stmt1.setString(3, this.startInterest);
            stmt1.setString(4, this.endInterest);
            stmt1.setString(5, this.username);
            stmt1.setString(6, this.deptCode);
            stmt1.setString(7, this.courseNum);
            stmt1.setString(8, this.startDate);
            stmt1.setString(9, this.sectionId);

            stmt2 = conn.preparedStatement(updateSQL2);
            stmt2.setString(1, this.skill);
            stmt1.setString(2, this.startLevel);
            stmt1.setString(3, this.endLevel);
            stmt1.setString(4, this.username);
            stmt1.setString(5, this.deptCode);
            stmt1.setString(6, this.courseNum);
            stmt1.setString(7, this.startDate);
            stmt1.setString(8, this.sectionId);

            stmt1.execute();
            stmt2.execute();

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
        }
    }

    public static List<Experience> getAllExperience(Connection conn) throws SQLExperience {
        List<Experience> experience = new ArrayList<Experience>();
        Statement stmt = null;

        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery()
        }
    }

    private boolean validate () {
		if (this.name == null)
			return false;
		if (this.pizzeria == null)
			return false;
		if (this.pizza == null)
			return false;
		return true;
	}

    // getters and setters
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