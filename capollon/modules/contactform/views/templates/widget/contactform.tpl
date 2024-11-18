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


<section>
  <div class="contact-form">
    <form action="{$urls.pages.contact}" method="post">
      {if $notifications}
        <div class="col-xs-12 alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
          <ul>
            {foreach $notifications.messages as $notif}
              <li>{$notif}</li>
            {/foreach}
          </ul>
        </div>
      {/if}
      {if !$notifications || $notifications.nw_error}
        <div class="form-group row">
          <div class="col-md-9 col-md-offset-3">
            <h3>Nous contacter</h3>
          </div>
        </div>
        <div>
              <label for="nom">
                <span></span>
                <input
                  type="text"
                  name="nom"
                  id="nom"
                  placeholder="Votre nom"
                  required
                />
              </label>
            </div>
            <div>
              <label for="mail">
                <span></span>
                <input
                  type="email"
                  name="email"
                  id="mail"
                  placeholder="Votre email"
                  required
                />
              </label>
            </div>
            <div>
              <label for="contenu">
                <span></span>
                <textarea
                  name="contenu"
                  id="contenu"
                  placeholder="Votre message"
                  required
                ></textarea>
              </label>
            </div>
            <div class="submit-container">
              <input type="submit" name="submit_contact_form" value="Envoyer" class="btn" />
            </div>
      {/if}
    </form>
  </div>
</section>
