-- Designate Room Types with a standard rate, room description, and if smoking is allowed

Create or replace view Designate_room as SELECT roomtype.RoomTypeRate as STANDARD_RATE,roomtype.RoomTypeDescription as Room_description,roomtype.SmokingPermission 
											from rooms join roomtype on roomtype.RoomTypeId=rooms.RoomType_RoomTypeId
                                            where SmokingPermission='1'
                                            group by RoomTypeRate;
                                            
                                            select * from Designate_room;