package Model.DTO.LEEDTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class TbFile implements Serializable {
	private Long number;
	private Long boardIdx;
	private String originalFileName;
	private String storedFileName;
	private Long fileSize;
	private String memId;

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	public Long getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(Long boardIdx) {
		this.boardIdx = boardIdx;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

}
