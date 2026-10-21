package com.amazon.sample.ui.services.catalog.model;

import com.amazon.sample.ui.client.catalog.models.model.Tag;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-10-19T08:23:33+0000",
    comments = "version: 1.6.3, compiler: Eclipse JDT (IDE) 3.46.200.v20260930-0211, environment: Java 25.0.4.1 (Eclipse Adoptium)"
)
@Component
public class CatalogMapperImpl implements CatalogMapper {

    @Override
    public Product product(com.amazon.sample.ui.client.catalog.models.model.Product product) {
        if ( product == null ) {
            return null;
        }

        String description = null;
        String id = null;
        String name = null;
        int price = 0;
        List<ProductTag> tags = null;

        description = product.getDescription();
        id = product.getId();
        name = product.getName();
        if ( product.getPrice() != null ) {
            price = product.getPrice();
        }
        tags = tagListToProductTagList( product.getTags() );

        Product product1 = new Product( id, name, description, price, tags );

        return product1;
    }

    @Override
    public ProductTag tag(Tag tag) {
        if ( tag == null ) {
            return null;
        }

        String displayName = null;
        String name = null;

        displayName = tag.getDisplayName();
        name = tag.getName();

        ProductTag productTag = new ProductTag( name, displayName );

        return productTag;
    }

    protected List<ProductTag> tagListToProductTagList(List<Tag> list) {
        if ( list == null ) {
            return null;
        }

        List<ProductTag> list1 = new ArrayList<ProductTag>( list.size() );
        for ( Tag tag : list ) {
            list1.add( tag( tag ) );
        }

        return list1;
    }
}
