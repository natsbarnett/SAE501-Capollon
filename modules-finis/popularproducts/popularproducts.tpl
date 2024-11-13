{if isset($randomProducts) && $randomProducts|@count > 0}
    <div class="random-products list-prod">
        {foreach from=$randomProducts item=product}
            <div class="product-card">
                <div class="card-image">
                    <picture>
                        {if isset($product.id_image) && $product.id_image != 0}
                            <img src="{$link->getImageLink($product.name|lower, $product.id_image, 'home_default')}"
                                 alt="{$product.name|escape:'html'}" loading="lazy" />
                        {else}
                            <img src="{$link->getMediaLink('img/no-picture.jpg')}" alt="Image non disponible" />
                        {/if}
                    </picture>
                </div>
                <div class="card-body">
                    <h3 class="h3 product-title">
                        <a href="{$link->getProductLink($product.id_product)}" content="{$link->getProductLink($product.id_product)}">{$product.name|truncate:30:'...'}</a>
                    </h3>
                    <div>
                        <a href="{$link->getProductLink($product.id_product)}" class="voir-plus-prod btn" title="En savoir plus sur {$product.name}">Voir plus</a>
                    </div>
                </div>
            </div>
        {/foreach}
    </div>

    <!-- Ajouter un bouton pour voir tous les produits -->
    <div class="catalog-button">
        <a href="/2-home" class="btn btn-primary">Voir tout le catalogue</a>
    </div>
{else}
    <p>Aucun produit trouvé.</p>
{/if}
