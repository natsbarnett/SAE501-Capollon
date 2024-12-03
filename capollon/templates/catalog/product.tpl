{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{extends file=$layout}

{block name='head' append}
  <meta property="og:type" content="product">
  {if $product.cover}
    <meta property="og:image" content="{$product.cover.large.url}">
  {/if}

  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
    <meta property="product:weight:value" content="{$product.weight}">
    <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='head_microdata_special'}
  {include file='_partials/microdata/product-jsonld.tpl'}
{/block}

{block name='content'}

  <section id="main">
    <meta content="{$product.url}">

    <div class="row product-container js-product-container">

      <aside id="fiche-produit">
        <h1>{block name='page_title'}{$product.name}{/block}</h1>
        {block name='product_description_short'}
          <p id="product-description-short-{$product.id}" class="product-description">{$product.description_short nofilter}
          </p>
        {/block}
        <div class="prix-gamme">
          <span class="prix">{block name='product_prices'}
              {include file='catalog/_partials/product-prices.tpl'}
            {/block}</span>
          <div class="gamme-list">
            {* TODO : Trouver un moyen d'ajouter les catégories dont le produit fait partie *}
          </div>
        </div>
        <div class="choix-taille">
          <div value="s" class="taille-capote">
            <label for="taille-s">
              {* <img src="/themes/capollon/assets/images/capotes/taille-s.svg"> *}
              <div class=taille_s>
                <img class=haut_capote_taille src="/themes/capollon/assets/images/capotes/haut_capote_taille.svg">
                <div class=corp_capote_taille></div>
                <img class=bas_capote_taille src="/themes/capollon/assets/images/capotes/bas_capote_taille.svg">
              </div>
              <span>S</span>
              <input type="radio" name="taille" id="taille-s" value="s">
            </label>
          </div>
          <div value="m" class="taille-capote">
            <label for="taille-m">
              {* <img src="/themes/capollon/assets/images/capotes/taille-s.svg"> *}
              <div class=taille_m>
                <img class=haut_capote_taille src="/themes/capollon/assets/images/capotes/haut_capote_taille.svg">
                <div class=corp_capote_taille></div>
                <img class=bas_capote_taille src="/themes/capollon/assets/images/capotes/bas_capote_taille.svg">
              </div>
              <span>M</span>
              <input type="radio" name="taille" id="taille-m" value="s">
            </label>
          </div>
          <div value="l" class="taille-capote">
            <label for="taille-l">
              <div class=taille_l>
                <img class=haut_capote_taille src="/themes/capollon/assets/images/capotes/haut_capote_taille.svg">
                <div class=corp_capote_taille></div>
                <img class=bas_capote_taille src="/themes/capollon/assets/images/capotes/bas_capote_taille.svg">
              </div>
              <span>L</span>
              <input type="radio" name="taille" id="taille-l" value="l">
            </label>
          </div>
          <div value="xl" class="taille-capote">
            <label for="taille-xl">
              <div class=taille_xl>
                <img class=haut_capote_taille src="/themes/capollon/assets/images/capotes/haut_capote_taille.svg">
                <div class=corp_capote_taille></div>
                <img class=bas_capote_taille src="/themes/capollon/assets/images/capotes/bas_capote_taille.svg">
              </div>
              <span>XL</span>
              <input type="radio" name="taille" id="taille-xl" value="xl">
            </label>
          </div>
        </div>

        {block name='product_variants'}
          {include file='catalog/_partials/product-variants.tpl'}
        {/block}
        
        {if $product.is_customizable && count($product.customizations.fields)}
          {block name='product_customization'}
            {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
          {/block}
        {/if}

        <div class="panier product-actions js-product-actions">
          {block name='product_buy'}
            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
              <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id"
                class="js-product-customization-id">

              {block name='product_discounts'}
                {include file='catalog/_partials/product-discounts.tpl'}
              {/block}

              {block name='product_add_to_cart'}
                {include file='catalog/_partials/product-add-to-cart.tpl'}
              {/block}

              {* Input to refresh product HTML removed, block kept for compatibility with themes *}
              {block name='product_refresh'}{/block}
            </form>

          {/block}
        </div>


      </aside>

      <div class="image-produit">
      <div class="image">
        {block name='product_cover_thumbnails'}
          {include file='catalog/_partials/product-cover-thumbnails.tpl'}
        {/block}
        <div class="scroll-box-arrows">
          <i class="material-icons left">&#xE314;</i>
          <i class="material-icons right">&#xE315;</i>
        </div>
      </div>
    </div>

      {$product.description nofilter}


      {block name='hook_display_reassurance'}
        {hook h='displayReassurance'}
      {/block}


      <div class="comment-section">
        <h2>Donnez votre avis</h2>
      </div>

      {block name='product_accessories'}
        {if $accessories}
          <section class="product-accessories clearfix">
            <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
            <div class="products row">
              {foreach from=$accessories item="product_accessory" key="position"}
                {block name='product_miniature'}
                  {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position productClasses="col-xs-12 col-sm-6 col-lg-4 col-xl-3"}
                {/block}
              {/foreach}
            </div>
          </section>
        {/if}
      {/block}

      {block name='product_footer'}
        {hook h='displayFooterProduct' product=$product category=$category}
      {/block}

      {block name='product_images_modal'}
        {include file='catalog/_partials/product-images-modal.tpl'}
      {/block}

      {block name='page_footer_container'}
        <footer class="page-footer">
          {block name='page_footer'}
            <!-- Footer content -->
          {/block}
        </footer>
      {/block}
  </section>

  <script src="/themes/capollon/assets/js/confettis.js"></script>
{/block}