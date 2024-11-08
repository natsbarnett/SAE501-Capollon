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
{extends file='page.tpl'}

{block name='page_content_container'}
  {* <section id="content" class="page-home">

      {block name='page_content'}
        {block name='hook_home'}
          {$HOOK_HOME nofilter}
        {/block}
      {/block}
      </section> *}

  <section class="landing">
    <div class="webgl-wow">
      <canvas></canvas>
      <div class="separator" id="sep-wow"></div>
    </div>
  </section>

  <section class="produits-phares">
    <h2>Nos produits phares</h2>
    {block name='hook_home'}
      {$HOOK_HOME nofilter}
    {/block}
  </section>

  <div class="separator"></div>

  <section id="histoire-engagement">
    <div class="histoire">
      <h2>Notre histoire</h2>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vitae
        repellat consequuntur sit quod praesentium optio. Sequi fuga
        necessitatibus quibusdam iusto aliquam. Excepturi perferendis
        recusandae, ullam obcaecati voluptas beatae iste maiores. Lorem
        ipsum dolor sit amet consectetur adipisicing elit. Maxime dolorem
        optio fuga aperiam rem cumque voluptates debitis minus doloremque
        enim, fugit nisi aspernatur amet ex molestiae quam est, natus in.
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Illo
        quaerat, eum atque quod repellendus placeat. Ad libero, doloribus
        quia omnis at repellat et voluptatem consequuntur odio similique quo
        unde nisi! Lorem ipsum dolor sit amet consectetur adipisicing elit.
        Non numquam laborum amet illum explicabo vitae facilis, aliquam sint
        harum dicta consectetur eaque expedita itaque omnis sunt vel
        laboriosam a modi. Lorem ipsum dolor sit amet consectetur
        adipisicing elit. Sunt nesciunt corporis at blanditiis sequi alias
        fugiat minima animi quis ratione veritatis voluptatem quod sint, ad
        itaque delectus saepe illum nobis! Lorem ipsum dolor sit amet
        consectetur, adipisicing elit. Consequuntur omnis consectetur
        dolorum perferendis, magni minima quisquam libero fugit, distinctio
        quidem excepturi reprehenderit suscipit expedita, non saepe nostrum.
        Similique, possimus nam.</p>
    </div>
    <div class="engagements text-right">
      <h2>Nos engagements</h2>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti
        harum quam temporibus commodi culpa. Maxime iure cupiditate nesciunt
        accusantium neque id modi at incidunt deleniti. Cum sequi eligendi
        totam vitae. Lorem ipsum dolor sit, amet consectetur adipisicing
        elit. Voluptatem eligendi quod sint quidem quasi aliquid saepe!
        Accusantium, sequi enim assumenda, nisi adipisci blanditiis
        recusandae, maxime quidem voluptatibus iusto perferendis
        consequatur! Lorem ipsum dolor sit amet consectetur adipisicing
        elit. Quisquam dicta eum, reprehenderit officiis numquam
        consequuntur vel facilis libero eveniet veniam officia voluptates
        possimus perferendis dignissimos minima laboriosam repellendus
        accusantium neque. Lorem ipsum dolor, sit amet consectetur
        adipisicing elit. Suscipit libero perspiciatis quam, illum
        exercitationem nisi dicta laboriosam commodi repudiandae quas totam
        tempore maxime aliquid similique, praesentium cumque, repellendus
        eligendi atque. Lorem ipsum dolor sit amet consectetur adipisicing
        elit. Ipsum incidunt hic quod recusandae! Sint, non ullam libero
        natus eveniet ad eos, ab unde error voluptate temporibus molestiae,
        cumque officia repellendus. Lorem, ipsum dolor sit amet consectetur
        adipisicing elit. Corporis iure et ipsum facilis dolorum,
        exercitationem est aperiam numquam modi earum laborum ratione cum
        expedita deleniti molestias sed commodi, nemo similique? Lorem ipsum
        dolor sit, amet consectetur adipisicing elit. Ratione nam veniam
        harum, itaque minus voluptatibus at nesciunt. Rem culpa quam unde
        ullam nostrum, deserunt exercitationem enim. Quae atque veritatis
        error!</p>
    </div>

  </section>
{/block}