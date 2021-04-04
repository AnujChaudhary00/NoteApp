package NoteBook;

import java.util.Date;


public class Note {
	int id;
	String Notename;
	
	public Note()
	{
		
	}
	
	public Note(int id, String Notename)
	{
		this.id=id;
		this.Notename=Notename;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNotename() {
		return Notename;
	}

	public void setNotename(String notename) {
		Notename = notename;
	}
	
	
}
