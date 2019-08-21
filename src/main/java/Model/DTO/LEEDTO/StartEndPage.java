package Model.DTO.LEEDTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class StartEndPage implements Serializable{
	Long startRow;
	Long endRow;
	public Long getStartRow() {
		return startRow;
	}
	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}
	public Long getEndRow() {
		return endRow;
	}
	public void setEndRow(Long endRow) {
		this.endRow = endRow;
	}
	
}
