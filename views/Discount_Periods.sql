-- There will be room rate periods to give discounts at various times of the year (e.g. Jan to March, July to Aug, Sept to Dec)

create or replace view Discount_periods as Select discount.DiscountPeriod,roomtype.RoomTypeRate as ActualRate,(roomtype.RoomTypeRate * (discount.DiscountPercent/100)) As After_Discount
from discount join rooms
on discount.DiscountId=rooms.Discount_DiscountId
join roomtype
on rooms.RoomType_RoomTypeId=roomtype.RoomTypeId
Group By discount.DiscountPeriod;

Select * from Discount_periods;

