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
{assign var="theme_dir" value=$urls.theme_dir}
{assign var="base_url" value=$urls.base_url}
{assign var="prodlink" value=$urls.pages.category}


{block name='header_top'}
  <nav role="navigation" id="navig" class="mobile-menu">
    <div class="header-links-toggle">
      <div class="liens">
        <div>
          <div>
            <img src="{$theme_dir}assets/images/profile.svg" alt="profil" class="profil" />
          </div>
          <div>
            <a href="{$base_url}">Accueil</a>
          </div>
          <div>
            <a href="{$prodlink}&id_category=2">Nos produits</a>
          </div>
          <div>
            <a href="{$base_url}contact-us">Contact</a>
          </div>
          <div class="option_connexion" id="menu_profil">
            {if $customer.is_logged}
              <!-- Vérifie si l'utilisateur est connecté -->
              <div class="option1"><a href="{$base_url}my-account">Mes infos</a></div>
              <div class="separation_option"></div>
              <div class="option_centre"><a href="{$base_url}cart?action=show">Mon panier</a></div>
              <div class="separation_option"></div>
              <div class="option2"><a href="{$base_url}?mylogout=">Se déconnecter</a></div>
            {else}
              <div class="option_seul"><a href="{$base_url}login">Se connecter</a></div>
            {/if}
          </div>
        </div>

        <div>
          <img src="{$theme_dir}assets/images/burger.svg" alt="" class="menu-button-close" width="100%" />
        </div>
      </div>
    </div>
    <div class="separator"></div>
  </nav>
  <div>
    <div>
      <a href="{$base_url}"><img src="{$theme_dir}assets/images/logo.svg" alt="logo" class="logo" /></a>
    </div>
    <div class="header-links">
      <div>
        <a href="{$prodlink}&id_category=2">Nos produits</a>
      </div>
      <div>
        <a href="{$base_url}contact-us">Contact</a>
      </div>
      <div id="disp-n-2">{hook h='displayNav2'}</div>
      <div>
        <img src="{$theme_dir}assets/images/profile.svg" alt="profil" class="profil" id="trigger" />
      </div>
    </div>
    <img src="{$theme_dir}assets/images/burger-lines.svg" alt="" class="menu-button" width="100%" />
{/block}