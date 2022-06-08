part of 'news_feed_styles.dart';

class NewsFeedScreen extends HookWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchBoxController = useTextEditingController();

    return Scaffold(
      backgroundColor: _kAppBarBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            minimum: const EdgeInsets.only(top: 100),
            sliver: SliverAppBar(
              floating: false,
              pinned: true,
              backgroundColor: _kAppBarBackgroundColor,
              title: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: Text(
                    'Browse',
                    textScaleFactor: _kTitleScaleFactor,
                    style: TextStyle(color: _kAppBarTitleTextColor),
                  ),
                ),
              ),
              bottom: AppBar(
                elevation: 0,
                backgroundColor: _kAppBarBackgroundColor,
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.bookmark,
                      color: _kAppBarCursorColor,
                    ),
                    onPressed: () {},
                  )
                ],
                title: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .045,
                  color: _kSearchBoxBackgroundColor,
                  child: Center(
                    child: TextField(
                      onSubmitted: (value) =>
                          context.read<NewsBloc>().add(SearchHeadlines(value)),
                      controller: searchBoxController,
                      cursorColor: _kAppBarCursorColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: _kAppBarSearchIconColor,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: _kAppBarCursorColor,
                          ),
                          onPressed: () {
                            searchBoxController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state is NewsLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(((context, index) {
                    return HeadLineTile(article: state.articles[index]);
                  })),
                );
              }
              return const SliverToBoxAdapter(
                child: Text('Unknown State'),
              );
            },
          ),
        ],
      ),
    );
  }
}
