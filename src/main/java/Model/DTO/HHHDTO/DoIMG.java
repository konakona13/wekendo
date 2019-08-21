package Model.DTO.HHHDTO;

import java.io.Serializable;

@SuppressWarnings("serial")

public class DoIMG implements Serializable
{
	private String doImgNum;
	private String doNum;
	private String hostNum;
	private String doImgName;
	private String doImgKind;
	
	public String getDoImgNum()
	{
		return doImgNum;
	}
	public void setDoImgNum(String doImgNum)
	{
		this.doImgNum = doImgNum;
	}
	public String getDoNum()
	{
		return doNum;
	}
	public void setDoNum(String doNum)
	{
		this.doNum = doNum;
	}
	public String getHostNum()
	{
		return hostNum;
	}
	public void setHostNum(String hostNum)
	{
		this.hostNum = hostNum;
	}
	public String getDoImgName()
	{
		return doImgName;
	}
	public void setDoImgName(String doImgName)
	{
		this.doImgName = doImgName;
	}
	public String getDoImgKind()
	{
		return doImgKind;
	}
	public void setDoImgKind(String doImgKind)
	{
		this.doImgKind = doImgKind;
	}
	
	
}
