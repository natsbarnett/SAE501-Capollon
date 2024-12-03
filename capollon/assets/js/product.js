$(document).on('change', '.product-variants select', function () {
    const selectedGroup = $(this).closest('.product-variants-item').data('group');
    const selectedAttribute = $(this).val();
  
    // Vérifiez que toutes les données nécessaires sont incluses
    prestashop.emit('updateProduct', {
      idProduct: prestashop.product.id,
      idProductAttribute: selectedAttribute,
      group: selectedGroup, // Ajoutez cette ligne si le groupe est requis
    });
  });