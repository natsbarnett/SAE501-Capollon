<?php
/**
* 2007-2024 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2024 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

class ContactToOverride extends Module
{
    public function __construct()
    {
        $this->name = 'contactoverride';
        $this->version = '1.0.0';
        $this->author = 'TonNom';
        $this->tab = 'others';
        $this->bootstrap = true;
        $this->ps_versions_compliancy = array('min' => '1.7.0.0', 'max' => _PS_VERSION_);

        parent::__construct();

        $this->displayName = $this->l('Contact Form Override');
        $this->description = $this->l('Override the default contact form module.');
    }

    public function install()
    {
        return parent::install() && $this->registerHook('actionContactFormSubmitAfter');
    }

    public function uninstall()
    {
        return parent::uninstall();
    }

    /**
     * Hook pour ajouter de la logique après la soumission du formulaire de contact.
     *
     * @param array $params
     */
    public function hookActionContactFormSubmitAfter($params)
    {
        // Récupérer les données soumises par le formulaire
        $name = $params['form_data']['nom'];
        $email = $params['form_data']['email'];
        $message = $params['form_data']['message'];

        // Enregistrer le message dans CustomerServiceMessage
        $this->saveMessageToCustomerService($name, $email, $message);
    }

    /**
     * Fonction pour enregistrer un message dans CustomerServiceMessage
     *
     * @param string $name
     * @param string $email
     * @param string $message
     */
    private function saveMessageToCustomerService($name, $email, $message)
    {
        // Créer un objet CustomerServiceMessage
        $customerServiceMessage = new CustomerServiceMessage();
        $customerServiceMessage->message = $message;
        $customerServiceMessage->email = $email;
        $customerServiceMessage->firstname = $name;
        $customerServiceMessage->date_add = date('Y-m-d H:i:s');
        $customerServiceMessage->date_upd = date('Y-m-d H:i:s');

        // Ajouter le message à la base de données
        if (!$customerServiceMessage->add()) {
            $this->errors[] = $this->l('Erreur lors de l\'enregistrement du message.');
        }
    }
}