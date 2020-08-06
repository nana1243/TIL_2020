package com.springbook.biz.board;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Board
 *
 */
@Entity
@Table(name="Board")
public class Board implements Serializable {
	
	
	@Id
	@GeneratedValue
	private int idBoard;
	private String name;
	private static final long serialVersionUID = 1L;

	public Board() {
		super();
	}

	public Board(int idBoard, String name) {
		super();
		this.idBoard = idBoard;
		this.name = name;
	}

	public int getIdBoard() {
		return idBoard;
	}

	public void setIdBoard(int idBoard) {
		this.idBoard = idBoard;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Board [idBoard=" + idBoard + ", name=" + name + "]";
	} 
	


}
