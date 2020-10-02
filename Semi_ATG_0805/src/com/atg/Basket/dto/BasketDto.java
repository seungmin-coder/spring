package com.atg.Basket.dto;

import com.atg.Item.dto.ItemDto;

public class BasketDto {
	
	private int bas_no;
	private int mb_no;
	private int item_no;
	private int bas_count;
	private ItemDto ItemDto;
	
	public BasketDto(int bas_no, int mb_no, int item_no, int bas_count, com.atg.Item.dto.ItemDto itemDto) {
		super();
		this.bas_no = bas_no;
		this.mb_no = mb_no;
		this.item_no = item_no;
		this.bas_count = bas_count;
		ItemDto = itemDto;
	}
	
	public BasketDto() {
		
	}
	public BasketDto(int bas_no, int mb_no, int item_no, int bas_count) {
		this.bas_no = bas_no;
		this.mb_no = mb_no;
		this.item_no = item_no;
		this.bas_count = bas_count;
	}
	public int getBas_no() {
		return bas_no;
	}
	public void setBas_no(int bas_no) {
		this.bas_no = bas_no;
	}
	public int getMb_no() {
		return mb_no;
	}
	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getBas_count() {
		return bas_count;
	}
	public void setBas_count(int bas_count) {
		this.bas_count = bas_count;
	}
	public ItemDto getItemDto() {
		return ItemDto;
	}
	public void setItemDto(ItemDto itemDto) {
		ItemDto = itemDto;
	}
	
	
}
