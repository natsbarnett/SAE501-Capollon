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
{block name='product_miniature_item'}

  <div class="product-card">
    <div class="card-image">
      <picture>
        {if !empty($product.cover.bySize.home_default.sources.avif)}
        <source srcset="{$product.cover.bySize.home_default.sources.avif}" type="image/avif">{/if}
        {if !empty($product.cover.bySize.home_default.sources.webp)}
        <source srcset="{$product.cover.bySize.home_default.sources.webp}" type="image/webp">{/if}
        <img src="{$product.cover.bySize.home_default.url}"
          alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
          loading="lazy" data-full-size-image-url="{$product.cover.large.url}"
          width="{$product.cover.bySize.home_default.width}" height="{$product.cover.bySize.home_default.height}" />
      </picture>
    </div>
    <div class="card-body">
      {block name='product_name'}
        {if $page.page_name == 'index'}
          <h3 class="h3 product-title"><a href="{$product.url}" content="{$product.url}">{$product.name|truncate:30:'...'}</a>
          </h3>
        {else}
          <h3 class="h3 product-title"><a href="{$product.url}" content="{$product.url}">{$product.name|truncate:30:'...'}</a>
          </h3>
        {/if}
      {/block}
      <div>
      <a href="{$product.url}"
      content="{$product.url}" class="voir-plus-prod btn" title="En savoir plus sur {$product.name}">Voir plus</a>
      </div>
    </div>
  </div>
    {/block}