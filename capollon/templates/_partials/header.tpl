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



{block name='header_top'}
  <nav role="navigation" id="navig" class="mobile-menu">
    <div class="header-links-toggle">
      <div class="liens">
        <div>
          <div>
            <a href="#">
            <img src="/themes/capollon/assets/images/profile.svg" alt="profil" class="profil" /></a>
          </div>
          <div>
            <a href="/">Accueil</a>
          </div>
          <div>
            <a href="#">Nos produits</a>
          </div>
          <div>
            <a href="#">Contact</a>
          </div>
          <div class="option_connexion">
          {if $logged} <!-- Vérifie si l'utilisateur est connecté -->
            <div class="option1"><a href="">Mes infos</a></div>
            <div class="separation_option"></div>
            <div class="option_centre"><a href="">Mon panier</a></div>
            <div class="separation_option"></div>
            <div class="option2"><a href="">Se déconnecter</a></div>
          {else}
              <div class="option1"><a href="{$urls.pages.authentication|escape:'html'}?create_account=1">Se connecter</a></div>
          {/if}
          </div>
        </div>
        <div>
          <img src="/themes/capollon/assets/images/burger.svg" alt="" class="menu-button-close" width="100%" />
        </div>
      </div>
    </div>
    <div class="separator"></div>
  </nav>
  <div>
    <div>
      <a href="/"><img src="/themes/capollon/assets/images/logo.svg" alt="logo" class="logo" /></a>
    </div>
    <div class="header-links">
      <div>
        <a href="#">Nos produits</a>
      </div>
      <div>
        <a href="#">Contact</a>
      </div>
      <div>
        <a href="#"><img src="/themes/capollon/assets/images/profile.svg" alt="profil" class="profil" /></a>
      </div>
    </div>
    <img src="/themes/capollon/assets/images/burger-lines.svg" alt="" class="menu-button" width="100%" />
{/block}