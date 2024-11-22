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
    <form>
      {if $notifications}
        <div class="notification {if $notifications.nw_error}notification-error{else}notification-success{/if}">
          <ul>
            {foreach $notifications.messages as $notif}
              <li>{$notif|escape:'htmlall':'UTF-8'}</li>
            {/foreach}
          </ul>
        </div>
      {/if}

      {if !$notifications || $notifications.nw_error}
        <div class="form-group row">
          <div class="col-md-9 col-md-offset-3">
            <h1>Nous contacter</h1>
          </div>
        </div>
        <div>
          <label for="nom">
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
          <label for="email">
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
          <label for="message">
            <textarea
              name="message"
              id="message"
              placeholder="Votre message"
              required
            ></textarea>
          </label>
        </div>
        <input type="hidden" id="token" name="token" value="{$token|escape:'htmlall':'UTF-8'}" />
        <div class="submit-container">
          <button type="button" id="send-button" name="submit_contact_form" class="btn"/>Envoyer</button>
        </div>
      {/if}
    </form>
  </div>
</section>

<script>
  console.log("hello");
  document.getElementById("send-button").addEventListener("click", function () {
    const id_contact = "2"; //id du customer service
    const email = document.getElementById("mail").value;
    const name = document.getElementById("nom").value;
    const message = document.getElementById("message").value;
    const token = document.getElementById("token").value;

    const form = document.createElement("form");
    form.method = "post";
    form.action = "{$urls.pages.contact|escape:'htmlall':'UTF-8'}";

    const input_id_contact = document.createElement("input");
    input_id_contact.type = "hidden";
    input_id_contact.name = "id_contact";
    input_id_contact.value = id_contact;
    form.appendChild(input_id_contact);

    const input_email = document.createElement("input");
    input_email.type = "email";
    input_email.name = "from";
    input_email.value = email;
    form.appendChild(input_email);

    const input_message = document.createElement("textarea");
    input_message.name = "message";
    input_message.textContent = "Message de " + name + " :\n" + message;
    form.appendChild(input_message);

    const input_token = document.createElement("input");
    input_token.type = "hidden";
    input_token.name = "token";
    input_token.value = token;
    form.appendChild(input_token)

    const input_url = document.createElement("input");
    input_url.type = "hidden";
    input_url.name = "url";
    input_url.value = "";
    form.appendChild(input_url);

    const submitButton = document.createElement("input");
    submitButton.type = "hidden";
    submitButton.name = "submitMessage"; 
    submitButton.value = "";
    form.appendChild(submitButton);

    document.body.appendChild(form);
    console.log(form);
    form.submit();

  });
</script>