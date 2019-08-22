package Model.DTO.HHHDTO;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Kendo implements Serializable
{
	private String doNum;
	private String hostNum;
	private String doName;
	private String doStartDate;
	private String doEndDate;
	private String doOpenDate;
	private String doCloseDate;
	private int doPp;
	private int doNowpp;
	private String doDetail;
	private String doOptGender;
	private String doOptAge;
	private String doStatus;
	
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
	public String getDoName()
	{
		return doName;
	}
	public void setDoName(String doName)
	{
		this.doName = doName;
	}
	public String getDoStartDate()
	{
		return doStartDate;
	}
	public void setDoStartDate(String doStartDate)
	{
		this.doStartDate = doStartDate;
	}
	public String getDoEndDate()
	{
		return doEndDate;
	}
	public void setDoEndDate(String doEndDate)
	{
		this.doEndDate = doEndDate;
	}
	public String getDoOpenDate()
	{
		return doOpenDate;
	}
	public void setDoOpenDate(String doOpenDate)
	{
		this.doOpenDate = doOpenDate;
	}
	public String getDoCloseDate()
	{
		return doCloseDate;
	}
	public void setDoCloseDate(String doCloseDate)
	{
		this.doCloseDate = doCloseDate;
	}
	public int getDoPp()
	{
		return doPp;
	}
	public void setDoPp(int doPp)
	{
		this.doPp = doPp;
	}
	public int getDoNowpp()
	{
		return doNowpp;
	}
	public void setDoNowpp(int doNowpp)
	{
		this.doNowpp = doNowpp;
	}
	public String getDoDetail()
	{
		return doDetail;
	}
	public void setDoDetail(String doDetail)
	{
		this.doDetail = doDetail;
	}
	public String getDoOptGender()
	{
		return doOptGender;
	}
	public void setDoOptGender(String doOptGender)
	{
		this.doOptGender = doOptGender;
	}
	public String getDoOptAge()
	{
		return doOptAge;
	}
	public void setDoOptAge(String doOptAge)
	{
		this.doOptAge = doOptAge;
	}
	public String getDoStatus()
	{
		return doStatus;
	}
	public void setDoStatus(String doStatus)
	{
		this.doStatus = doStatus;
	}
	
	
	
	
	

}
