package com.cea;

import java.sql.*;
import java.util.*;

public class Experience {
    private String username;
    private String courseNum;
    private String startDate;
    private String sectionId;
    private String grade;
    private String satisfaction;
    private String rankOfInstructor;
    private String startInterest;
    private String endInterest;

    private String updateSQL1 = "UPDATE TABLE experience" +
                                "SET "

    PreparedStatement stmt1 = null;
    PreparedStatement stmt2 = null;
                                

    public void addExperienceToDB(Connection conn) throws SQLException {
		if (!this.validate()){
			System.out.println("Experience fields not set");
			System.exit(1);
		}

        try {
            conn.setAutoCommit(false);
            stmt1 = conn.preparedStatement();

        } catch (SQLException e) {
            SQLError.show(e);
        } finally {

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
}