part of 'home.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  final _products = sampleProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // app bar
        Container(
          height: 64,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // search icon
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),

              // category dropdown
              GestureDetector(
                onTap: () {
                  // TODO -> show categories to select from
                  print('tapped category');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: DeviceConfig.kColorScheme.onBackground
                          .withOpacity(0.15),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Men',
                        style: DeviceConfig.kTextTheme.bodyText1?.copyWith(
                          color: DeviceConfig.kColorScheme.onBackground,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),

              // shopping basket
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),
            ],
          ),
        ),

        // user info
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 16,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hi, Alex!', // TODO -> use current user's name
              style: DeviceConfig.kTextTheme.headline6?.copyWith(
                color: DeviceConfig.kColorScheme.onBackground,
              ),
            ),
          ),
        ),

        // trending
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 12,
            ),
            width: DeviceConfig.kDeviceWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'New collection from Versace',
                    // TODO -> use trending product's brand
                    style: DeviceConfig.kTextTheme.headline6?.copyWith(
                      color: DeviceConfig.kColorScheme.onBackground
                          .withOpacity(0.4),
                    ),
                  ),
                ),

                // trending product
                Expanded(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    width: DeviceConfig.kDeviceWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: DeviceConfig.kColorScheme.onBackground
                            .withOpacity(0.15),
                      ),
                    ),
                    child: Row(
                      children: [
                        // trending product image
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: DeviceConfig.kColorScheme.surface,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  // TODO -> use trending product's image
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1589363460779-cd717d2ed8fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1789&q=80')),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        // icon
                        InkWell(
                          splashColor: DeviceConfig.kColorScheme.surface,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          onTap: () {
                            // TODO -> show trending product details
                          },
                          child: Container(
                            width: DeviceConfig.kDeviceWidth * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // color: DeviceConfig.kColorScheme.background,
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.arrow_right_alt_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // categories
        Container(
          padding: EdgeInsets.fromLTRB(24, 12, 0, 12),
          height: 56,
          width: DeviceConfig.kDeviceWidth,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // TODO -> update UI with selected category
                },
                child: Row(
                  children: [
                    // category name
                    Text(
                      // TODO -> category name
                      'Accessories',
                      style: DeviceConfig.kTextTheme.headline6?.copyWith(
                        color: DeviceConfig.kColorScheme.onBackground
                            .withOpacity(index == 0 ? 1.0 : 0.25),
                      ),
                    ),

                    // category products count
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      alignment: Alignment.topRight,
                      child: Text(
                        // TODO -> category product count
                        '123',
                        style: DeviceConfig.kTextTheme.caption?.copyWith(
                          color: DeviceConfig.kColorScheme.onBackground
                              .withOpacity(index == 0 ? 1.0 : 0.25),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemCount: 10,
          ),
        ),

        // products
        Expanded(
          flex: 3,
          child: SizedBox(
            width: DeviceConfig.kDeviceWidth,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCard(product: _products[index]);
              },
              separatorBuilder: (_, __) => SizedBox(width: 16),
              itemCount: _products.length,
            ),
          ),
        ),

        // more details button
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: RoundedCornerButton(
            label: 'See all accessories',
            onTap: () {},
            icon: Icons.chevron_right_outlined,
          ),
        ),
      ],
    );
  }
}
