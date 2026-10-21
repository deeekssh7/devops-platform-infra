package com.amazon.sample.orders.web.payload;

import com.amazon.sample.orders.entities.ShippingAddressEntity;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-10-19T08:23:25+0000",
    comments = "version: 1.6.3, compiler: Eclipse JDT (IDE) 3.46.200.v20260930-0211, environment: Java 25.0.4.1 (Eclipse Adoptium)"
)
@Component
public class ShippingAddressMapperImpl implements ShippingAddressMapper {

    @Override
    public ShippingAddress toShippingAddress(ShippingAddressEntity entity) {
        if ( entity == null ) {
            return null;
        }

        ShippingAddress shippingAddress = new ShippingAddress();

        shippingAddress.setAddress1( entity.getAddress1() );
        shippingAddress.setAddress2( entity.getAddress2() );
        shippingAddress.setCity( entity.getCity() );
        shippingAddress.setEmail( entity.getEmail() );
        shippingAddress.setFirstName( entity.getFirstName() );
        shippingAddress.setLastName( entity.getLastName() );
        shippingAddress.setState( entity.getState() );
        shippingAddress.setZipCode( entity.getZipCode() );

        return shippingAddress;
    }

    @Override
    public ShippingAddressEntity toShippingAddressEntity(ShippingAddress item) {
        if ( item == null ) {
            return null;
        }

        ShippingAddressEntity shippingAddressEntity = new ShippingAddressEntity();

        shippingAddressEntity.setFirstName( item.getFirstName() );
        shippingAddressEntity.setLastName( item.getLastName() );
        shippingAddressEntity.setEmail( item.getEmail() );
        shippingAddressEntity.setAddress1( item.getAddress1() );
        shippingAddressEntity.setAddress2( item.getAddress2() );
        shippingAddressEntity.setCity( item.getCity() );
        shippingAddressEntity.setZipCode( item.getZipCode() );
        shippingAddressEntity.setState( item.getState() );

        return shippingAddressEntity;
    }
}
