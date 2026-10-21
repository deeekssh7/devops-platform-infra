package com.amazon.sample.ui.services.checkout.model;

import com.amazon.sample.ui.client.checkout.models.Item;
import com.amazon.sample.ui.client.checkout.models.ItemRequest;
import com.amazon.sample.ui.client.checkout.models.ShippingAddress;
import com.amazon.sample.ui.client.checkout.models.ShippingRates;
import com.amazon.sample.ui.services.carts.model.CartItem;
import com.microsoft.kiota.serialization.ParseNode;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-10-19T08:23:34+0000",
    comments = "version: 1.6.3, compiler: Eclipse JDT (IDE) 3.46.200.v20260930-0211, environment: Java 25.0.4.1 (Eclipse Adoptium)"
)
@Component
public class CheckoutMapperImpl implements CheckoutMapper {

    @Override
    public Checkout checkout(com.amazon.sample.ui.client.checkout.models.Checkout checkout) {
        if ( checkout == null ) {
            return null;
        }

        List<ShippingOption> shippingOptions = null;
        List<CheckoutItem> items = null;
        int shipping = 0;
        int subtotal = 0;
        int tax = 0;
        int total = 0;

        List<com.amazon.sample.ui.client.checkout.models.ShippingOption> rates = checkoutShippingRatesRates( checkout );
        shippingOptions = shippingOptionListToShippingOptionList( rates );
        items = itemListToCheckoutItemList( checkout.getItems() );
        if ( checkout.getShipping() != null ) {
            shipping = checkout.getShipping();
        }
        if ( checkout.getSubtotal() != null ) {
            subtotal = checkout.getSubtotal();
        }
        if ( checkout.getTax() != null ) {
            tax = checkout.getTax();
        }
        if ( checkout.getTotal() != null ) {
            total = checkout.getTotal();
        }

        Checkout checkout1 = new Checkout( items, subtotal, tax, shipping, total, shippingOptions );

        return checkout1;
    }

    @Override
    public CheckoutSubmitted submitted(com.amazon.sample.ui.client.checkout.models.CheckoutSubmitted submitted) {
        if ( submitted == null ) {
            return null;
        }

        String email = null;
        List<CheckoutItem> items = null;
        String orderId = null;
        int shipping = 0;
        int subtotal = 0;
        int tax = 0;
        int total = 0;

        email = submitted.getEmail();
        items = itemListToCheckoutItemList( submitted.getItems() );
        orderId = submitted.getOrderId();
        if ( submitted.getShipping() != null ) {
            shipping = submitted.getShipping();
        }
        if ( submitted.getSubtotal() != null ) {
            subtotal = submitted.getSubtotal();
        }
        if ( submitted.getTax() != null ) {
            tax = submitted.getTax();
        }
        if ( submitted.getTotal() != null ) {
            total = submitted.getTotal();
        }

        CheckoutSubmitted checkoutSubmitted = new CheckoutSubmitted( orderId, email, subtotal, tax, shipping, total, items );

        return checkoutSubmitted;
    }

    @Override
    public ShippingAddress clientShippingAddress(com.amazon.sample.ui.services.checkout.model.ShippingAddress address) {
        if ( address == null ) {
            return null;
        }

        ShippingAddress shippingAddress = new ShippingAddress();

        shippingAddress.setAddress1( address.getAddress1() );
        shippingAddress.setAddress2( address.getAddress2() );
        shippingAddress.setCity( address.getCity() );
        shippingAddress.setEmail( address.getEmail() );
        shippingAddress.setFirstName( address.getFirstName() );
        shippingAddress.setLastName( address.getLastName() );
        shippingAddress.setState( address.getState() );
        shippingAddress.setZip( address.getZip() );

        return shippingAddress;
    }

    @Override
    public CheckoutItem item(ItemRequest clientItem) {
        if ( clientItem == null ) {
            return null;
        }

        CheckoutItem checkoutItem = new CheckoutItem();

        checkoutItem.setId( clientItem.getId() );
        checkoutItem.setName( clientItem.getName() );
        checkoutItem.setPrice( clientItem.getPrice() );
        checkoutItem.setQuantity( clientItem.getQuantity() );

        return checkoutItem;
    }

    @Override
    public ItemRequest fromCartItem(CartItem cartItem) {
        if ( cartItem == null ) {
            return null;
        }

        ItemRequest itemRequest = new ItemRequest();

        itemRequest.setId( cartItem.getId() );
        itemRequest.setName( cartItem.getName() );
        itemRequest.setPrice( cartItem.getPrice() );
        itemRequest.setQuantity( cartItem.getQuantity() );

        return itemRequest;
    }

    @Override
    public ItemRequest modelitem(Item cartItem) {
        if ( cartItem == null ) {
            return null;
        }

        ItemRequest itemRequest = new ItemRequest();

        Map<String, Object> map = cartItem.getAdditionalData();
        if ( map != null ) {
            itemRequest.setAdditionalData( new LinkedHashMap<String, Object>( map ) );
        }
        itemRequest.setId( cartItem.getId() );
        itemRequest.setName( cartItem.getName() );
        itemRequest.setPrice( cartItem.getPrice() );
        itemRequest.setQuantity( cartItem.getQuantity() );
        if ( itemRequest.getFieldDeserializers() != null ) {
            Map<String, Consumer<ParseNode>> map1 = cartItem.getFieldDeserializers();
            if ( map1 != null ) {
                itemRequest.getFieldDeserializers().putAll( map1 );
            }
        }

        return itemRequest;
    }

    @Override
    public CheckoutItem cartItem(CartItem cartItem) {
        if ( cartItem == null ) {
            return null;
        }

        CheckoutItem checkoutItem = new CheckoutItem();

        checkoutItem.setId( cartItem.getId() );
        checkoutItem.setName( cartItem.getName() );
        checkoutItem.setPrice( cartItem.getPrice() );
        checkoutItem.setQuantity( cartItem.getQuantity() );

        return checkoutItem;
    }

    @Override
    public CheckoutItem item(CheckoutItemRequest item) {
        if ( item == null ) {
            return null;
        }

        CheckoutItem checkoutItem = new CheckoutItem();

        checkoutItem.setId( item.getId() );
        checkoutItem.setName( item.getName() );
        checkoutItem.setPrice( item.getPrice() );
        checkoutItem.setQuantity( item.getQuantity() );

        return checkoutItem;
    }

    @Override
    public CheckoutItem fromModelItem(Item item) {
        if ( item == null ) {
            return null;
        }

        CheckoutItem checkoutItem = new CheckoutItem();

        checkoutItem.setId( item.getId() );
        checkoutItem.setName( item.getName() );
        checkoutItem.setPrice( item.getPrice() );
        checkoutItem.setQuantity( item.getQuantity() );
        checkoutItem.setTotalCost( item.getTotalCost() );

        return checkoutItem;
    }

    private List<com.amazon.sample.ui.client.checkout.models.ShippingOption> checkoutShippingRatesRates(com.amazon.sample.ui.client.checkout.models.Checkout checkout) {
        ShippingRates shippingRates = checkout.getShippingRates();
        if ( shippingRates == null ) {
            return null;
        }
        return shippingRates.getRates();
    }

    protected ShippingOption shippingOptionToShippingOption(com.amazon.sample.ui.client.checkout.models.ShippingOption shippingOption) {
        if ( shippingOption == null ) {
            return null;
        }

        ShippingOption shippingOption1 = new ShippingOption();

        shippingOption1.setAmount( shippingOption.getAmount() );
        shippingOption1.setEstimatedDays( shippingOption.getEstimatedDays() );
        shippingOption1.setName( shippingOption.getName() );
        shippingOption1.setToken( shippingOption.getToken() );

        return shippingOption1;
    }

    protected List<ShippingOption> shippingOptionListToShippingOptionList(List<com.amazon.sample.ui.client.checkout.models.ShippingOption> list) {
        if ( list == null ) {
            return null;
        }

        List<ShippingOption> list1 = new ArrayList<ShippingOption>( list.size() );
        for ( com.amazon.sample.ui.client.checkout.models.ShippingOption shippingOption : list ) {
            list1.add( shippingOptionToShippingOption( shippingOption ) );
        }

        return list1;
    }

    protected List<CheckoutItem> itemListToCheckoutItemList(List<Item> list) {
        if ( list == null ) {
            return null;
        }

        List<CheckoutItem> list1 = new ArrayList<CheckoutItem>( list.size() );
        for ( Item item : list ) {
            list1.add( fromModelItem( item ) );
        }

        return list1;
    }
}
