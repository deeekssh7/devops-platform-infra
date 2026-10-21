package com.amazon.sample.orders.web.payload;

import com.amazon.sample.orders.entities.OrderItemEntity;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-10-19T08:23:25+0000",
    comments = "version: 1.6.3, compiler: Eclipse JDT (IDE) 3.46.200.v20260930-0211, environment: Java 25.0.4.1 (Eclipse Adoptium)"
)
@Component
public class OrderItemMapperImpl implements OrderItemMapper {

    @Override
    public OrderItem toOrderItem(OrderItemEntity entity) {
        if ( entity == null ) {
            return null;
        }

        OrderItem orderItem = new OrderItem();

        orderItem.setProductId( entity.getProductId() );
        orderItem.setQuantity( entity.getQuantity() );
        orderItem.setTotalCost( entity.getTotalCost() );
        orderItem.setUnitCost( entity.getUnitCost() );

        return orderItem;
    }

    @Override
    public OrderItemEntity toOrderItemEntity(OrderItem item) {
        if ( item == null ) {
            return null;
        }

        OrderItemEntity orderItemEntity = new OrderItemEntity();

        orderItemEntity.setProductId( item.getProductId() );
        orderItemEntity.setQuantity( item.getQuantity() );
        orderItemEntity.setUnitCost( item.getUnitCost() );
        orderItemEntity.setTotalCost( item.getTotalCost() );

        return orderItemEntity;
    }
}
