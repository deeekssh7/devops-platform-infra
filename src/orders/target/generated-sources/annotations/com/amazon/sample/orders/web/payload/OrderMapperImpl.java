package com.amazon.sample.orders.web.payload;

import com.amazon.sample.orders.entities.OrderEntity;
import com.amazon.sample.orders.entities.OrderItemEntity;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-10-19T08:23:25+0000",
    comments = "version: 1.6.3, compiler: Eclipse JDT (IDE) 3.46.200.v20260930-0211, environment: Java 25.0.4.1 (Eclipse Adoptium)"
)
@Component
public class OrderMapperImpl implements OrderMapper {

    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private ShippingAddressMapper shippingAddressMapper;

    @Override
    public ExistingOrder toExistingOrder(OrderEntity entity) {
        if ( entity == null ) {
            return null;
        }

        ExistingOrder existingOrder = new ExistingOrder();

        existingOrder.setItems( orderItemEntityListToOrderItemList( entity.getItems() ) );
        existingOrder.setShippingAddress( shippingAddressMapper.toShippingAddress( entity.getShippingAddress() ) );
        existingOrder.setCreatedDate( entity.getCreatedDate() );
        existingOrder.setId( entity.getId() );

        return existingOrder;
    }

    @Override
    public OrderEntity toOrderEntity(Order order) {
        if ( order == null ) {
            return null;
        }

        OrderEntity orderEntity = new OrderEntity();

        orderEntity.setItems( orderItemListToOrderItemEntityList( order.getItems() ) );
        orderEntity.setShippingAddress( shippingAddressMapper.toShippingAddressEntity( order.getShippingAddress() ) );

        return orderEntity;
    }

    protected List<OrderItem> orderItemEntityListToOrderItemList(List<OrderItemEntity> list) {
        if ( list == null ) {
            return null;
        }

        List<OrderItem> list1 = new ArrayList<OrderItem>( list.size() );
        for ( OrderItemEntity orderItemEntity : list ) {
            list1.add( orderItemMapper.toOrderItem( orderItemEntity ) );
        }

        return list1;
    }

    protected List<OrderItemEntity> orderItemListToOrderItemEntityList(List<OrderItem> list) {
        if ( list == null ) {
            return null;
        }

        List<OrderItemEntity> list1 = new ArrayList<OrderItemEntity>( list.size() );
        for ( OrderItem orderItem : list ) {
            list1.add( orderItemMapper.toOrderItemEntity( orderItem ) );
        }

        return list1;
    }
}
