package com.zeus.mapper;

import java.util.List;
import com.zeus.domain.Item2;

public interface Item2Mapper {
	public void create(Item2 item) throws Exception;

	public Item2 read(Integer itemId) throws Exception;

	public void update(Item2 item) throws Exception;

	public void delete(Integer itemId) throws Exception;

	public List<Item2> list() throws Exception;

	public String getPicture(Integer itemId) throws Exception;

	public String getPicture2(Integer itemId) throws Exception;
}
