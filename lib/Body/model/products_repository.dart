// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'product.dart';
import 'product.dart';

class ProductsRepository {
  static const _allProducts = <Product>[
    Product(
      category: Category.accessories,
      id: 0,
      isFeatured: true,
      name: 'Vagabond sack',
      brandname: 'abc',
      
      price: 1,
    ),
    Product(
      category: Category.accessories,
      id: 1,
      isFeatured: true,
      brandname: 'cde',
      name: 'Stella sunglasses',
      price: 58,
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: false,
      brandname: 'fhd',
      name: 'Whitney belt',
      price: 35,
    ),
    Product(
      category: Category.accessories,
      id: 3,
      isFeatured: true,
      brandname: 'fkd',
      name: 'Garden strand',
      price: 98,
    ),
    Product(
      category: Category.accessories,
      id: 4,
      isFeatured: false,
      name: 'Strut earrings',
      price: 34,
      brandname: 'lll',
    ),
    Product(
      category: Category.accessories,
      id: 5,
      brandname: 'ffs',
      isFeatured: false,
      name: 'Varsity socks',
      price: 12,
    ),
    Product(
      category: Category.accessories,
      id: 6,
      brandname: 'sgs',
      isFeatured: false,
      name: 'Weave keyring',
      price: 16,
    ),
    Product(
      category: Category.accessories,
      id: 7,
      brandname: 'gsr',
      isFeatured: true,
      name: 'Gatsby hat',
      price: 40,
    ),
    Product(
      category: Category.accessories,
      id: 8,
      brandname: 'gwg',
      isFeatured: true,
      name: 'Shrug bag',
      price: 198,
    ),
    Product(
      category: Category.home,
      id: 9,
      brandname: 'gsf',
      isFeatured: true,
      name: 'Gilt desk trio',
      price: 58,
    ),
    Product(
      category: Category.home,
      id: 10,
      brandname: 'kgo',
      isFeatured: false,
      name: 'Copper wire rack',
      price: 18,
    ),
    Product(
      category: Category.home,
      id: 11,
      brandname: 'ksi',
      isFeatured: false,
      name: 'Soothe ceramic set',
      price: 28,
    ),
    Product(
      category: Category.home,
      id: 12,
      brandname: 'vjt',
      isFeatured: false,
      name: 'Hurrahs tea set',
      price: 34,
    ),
    Product(
      category: Category.home,
      id: 13,
      brandname: 'hfl',
      isFeatured: true,
      name: 'Blue stone mug',
      price: 18,
    ),
    Product(
      category: Category.home,
      id: 14,
      brandname: 'hfu',
      isFeatured: true,
      name: 'Rainwater tray',
      price: 27,
    ),
    Product(
      category: Category.home,
      id: 15,
      brandname: 'hfj',
      isFeatured: true,
      name: 'Chambray napkins',
      price: 16,
    ),
    Product(
      category: Category.home,
      id: 16,
      brandname: 'hfi',
      isFeatured: true,
      name: 'Succulent planters',
      price: 16,
    ),
    Product(
      category: Category.home,
      id: 17,
      brandname: 'fjf',
      isFeatured: false,
      name: 'Quartet table',
      price: 175,
    ),
    Product(
      category: Category.home,
      id: 18,
      brandname: 'bak',
      isFeatured: true,
      name: 'Kitchen quattro',
      price: 129,
    ),
    Product(
      category: Category.clothing,
      id: 19,
      isFeatured: false,
      brandname: 'hfl',
      name: 'Clay sweater',
      price: 48,
    ),
    Product(
      category: Category.clothing,
      id: 20,
      brandname: 'fhg',
      isFeatured: false,
      name: 'Sea tunic',
      price: 45,
    ),
    Product(
      category: Category.clothing,
      id: 21,
      brandname: 'hfl',
      isFeatured: false,
      name: 'Plaster tunic',
      price: 38,
    ),
    Product(
      category: Category.clothing,
      id: 22,
      brandname: 'dnv',
      isFeatured: false,
      name: 'White pinstripe shirt',
      price: 70,
    ),
    Product(
      category: Category.clothing,
      id: 23,
      brandname: 'vhr',
      isFeatured: false,
      name: 'Chambray shirt',
      price: 70,
    ),
    Product(
      category: Category.clothing,
      id: 24,
      brandname: 'hdg',
      isFeatured: true,
      name: 'Seabreeze sweater',
      price: 60,
    ),
    Product(
      category: Category.clothing,
      id: 25,
      brandname: 'hfu',
      isFeatured: false,
      name: 'Gentry jacket',
      price: 178,
    ),
    Product(
      category: Category.clothing,
      id: 26,
      brandname: 'fhd',
      isFeatured: false,
      name: 'Navy trousers',
      price: 74,
    ),
    Product(
      category: Category.clothing,
      id: 27,
      brandname: 'fhr',
      isFeatured: true,
      name: 'Walter henley (white)',
      price: 38,
    ),
    Product(
      category: Category.clothing,
      id: 28,
      brandname: 'fhb',
      isFeatured: true,
      name: 'Surf and perf shirt',
      price: 48,
    ),
    Product(
      category: Category.clothing,
      id: 29,
      brandname: 'gfa',
      isFeatured: true,
      name: 'Ginger scarf',
      price: 98,
    ),
    Product(
      category: Category.clothing,
      id: 30,
      isFeatured: true,
      brandname: 'nsg',
      name: 'Ramona crossover',
      price: 68,
    ),
    Product(
      category: Category.clothing,
      id: 31,
      brandname: 'dgf',
      isFeatured: false,
      name: 'Chambray shirt',
      price: 38,
    ),
    Product(
      category: Category.clothing,
      id: 32,
      brandname: 'gjb',
      isFeatured: false,
      name: 'Classic white collar',
      price: 58,
    ),
    Product(
      category: Category.clothing,
      id: 33,
      brandname: 'hgp',
      isFeatured: true,
      name: 'Cerise scallop tee',
      price: 42,
    ),
    Product(
      category: Category.clothing,
      id: 34,
      brandname: 'gjt',
      isFeatured: false,
      name: 'Shoulder rolls tee',
      price: 27,
    ),
    Product(
      category: Category.clothing,
      id: 35,
      brandname: 'sgb',
      isFeatured: false,
      name: 'Grey slouch tank',
      price: 24,
    ),
    Product(
      category: Category.clothing,
      id: 36,
      brandname: 'sjg',
      isFeatured: false,
      name: 'Sunshirt dress',
      price: 58,
    ),
    Product(
      category: Category.clothing,
      id: 37,
      brandname: 'dgt',
      isFeatured: true,
      name: 'Fine lines tee',
      price: 58,
    ),
  ];

  static const _allAccssoriesProduct = <Product>[
    Product(
      category: Category.accessories,
      id: 0,
      isFeatured: true,
      name: 'Vagabond sack',
      brandname: 'abc',
      price: 1,
    ),
    Product(
      category: Category.accessories,
      id: 1,
      isFeatured: true,
      brandname: 'cde',
      name: 'Stella sunglasses',
      price: 58,
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: false,
      brandname: 'fhd',
      name: 'Whitney belt',
      price: 35,
    ),
    Product(
      category: Category.accessories,
      id: 3,
      isFeatured: true,
      brandname: 'fkd',
      name: 'Garden strand',
      price: 98,
    ),
    Product(
      category: Category.accessories,
      id: 4,
      isFeatured: false,
      name: 'Strut earrings',
      price: 34,
      brandname: 'lll',
    ),
    Product(
      category: Category.accessories,
      id: 5,
      brandname: 'ffs',
      isFeatured: false,
      name: 'Varsity socks',
      price: 12,
    ),
    Product(
      category: Category.accessories,
      id: 6,
      brandname: 'sgs',
      isFeatured: false,
      name: 'Weave keyring',
      price: 16,
    ),
    Product(
      category: Category.accessories,
      id: 7,
      brandname: 'gsr',
      isFeatured: true,
      name: 'Gatsby hat',
      price: 40,
    ),
    Product(
      category: Category.accessories,
      id: 8,
      brandname: 'gwg',
      isFeatured: true,
      name: 'Shrug bag',
      price: 198,
    ),
  ];

  static List<Product> loadProducts(Category category) {
    if (category == Category.all) {
      return _allProducts;
    }
    if (category == Category.accessories) {
      return _allAccssoriesProduct; //TODO: Define category here
    } else {
      return _allProducts.where((p) => p.category == category).toList();
    }
  }
}
