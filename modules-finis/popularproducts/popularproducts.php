<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class PopularProducts extends Module
{
    public function __construct()
    {
        $this->name = 'popularproducts';
        $this->tab = 'front_office_features';
        $this->version = '1.0.18';
        $this->author = 'Capollon';
        $this->need_instance = 0;
        $this->bootstrap = true; // Optionnel, selon la version de PrestaShop

        parent::__construct();

        $this->displayName = $this->l('Popular Products');
        $this->description = $this->l('Displays popular products on the homepage.');
    }

    public function uninstall()
    {
        return parent::uninstall() && $this->unregisterHook('prodListHome');
    }


    public function install()
    {
        return parent::install() && $this->registerHook('prodListHome');
    }

    public function getRandomProducts()
    {
        $context = Context::getContext();
        $languageId = $context->language->id;
        $limit = 3; // Limiter à 3 produits

        // Requête SQL pour récupérer 3 produits au hasard
        $sql = 'SELECT p.id_product, pl.name, i.id_image, i.cover 
            FROM ' . _DB_PREFIX_ . 'product p
            LEFT JOIN ' . _DB_PREFIX_ . 'product_lang pl ON (p.id_product = pl.id_product AND pl.id_lang = ' . (int) $languageId . ')
            LEFT JOIN ' . _DB_PREFIX_ . 'image i ON (i.id_product = p.id_product AND i.cover = 1)
            WHERE p.active = 1
            ORDER BY RAND()
            LIMIT ' . (int) $limit;

        $products = Db::getInstance()->executeS($sql);

        return $products;
    }



    public function hookProdListHome($params)
    {
        // Récupérer 3 produits aléatoires
        $randomProducts = $this->getRandomProducts();

        // Assigner les produits au template
        $this->context->smarty->assign('randomProducts', $randomProducts);

        // Afficher le template
        return $this->display(__FILE__, 'popularproducts.tpl');

    }




}
