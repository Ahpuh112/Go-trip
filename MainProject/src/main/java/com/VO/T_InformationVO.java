package com.VO;

public class T_InformationVO {

	private int locationNum;
	private String location;
	private String placeName;
	private String placeUrl;
	private String imgUrl;
	private String someMBTI;
	private int placeNum;

	public T_InformationVO(int locationNum, String location, String placeName, String placeUrl, String imgUrl,
			String someMBTI, int placeNum) {
		this.locationNum = locationNum;
		this.location = location;
		this.placeName = placeName;
		this.placeUrl = placeUrl;
		this.imgUrl = imgUrl;
		this.someMBTI = someMBTI;
		this.placeNum = placeNum;
	}


	public T_InformationVO() {
		// TODO Auto-generated constructor stub
	}


	public int getLocationNum() {
		return locationNum;
	}


	public void setLocationNum(int locationNum) {
		this.locationNum = locationNum;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getPlaceName() {
		return placeName;
	}


	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}


	public String getPlaceUrl() {
		return placeUrl;
	}


	public void setPlaceUrl(String placeUrl) {
		this.placeUrl = placeUrl;
	}


	public String getImgUrl() {
		return imgUrl;
	}


	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}


	public String getSomeMBTI() {
		return someMBTI;
	}


	public void setSomeMBTI(String someMBTI) {
		this.someMBTI = someMBTI;
	}


	public int getPlaceNum() {
		return placeNum;
	}


	public void setPlaceNum(int placeNum) {
		this.placeNum = placeNum;
	}
}

	

