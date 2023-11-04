import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //use SliverAppBar.mediun or just SliverAppBar
          //if you need less larger
          SliverAppBar.large(
            leading: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.info_outline_rounded,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            actions: [
              SizedBox(
                child: IconButton(
                  onPressed: null,
                  icon: const Icon(Icons.settings_applications_rounded),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            ],
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('XYZ Blogs'),
              centerTitle: true,
            ),
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          //non-sliver widget you need
          //other container to adapt to custom scrollview
          //that is SliverToBoxAdapter.

          SliverToBoxAdapter(
            child: Center(
                child: Text('Recent Posts',
                    style: Theme.of(context).textTheme.headlineLarge)),
          ),

          //Just attach any widget unders Sliver,
          //SliverList, SliverPadding...

          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Card(
                color: Theme.of(context).colorScheme.inversePrimary,
                child: ListTile(
                  title: Text('Grid Item $index'),
                ),
              );
            },
            itemCount: 8,
          ),

          SliverToBoxAdapter(
            child: Center(
                child: Text('Popular Posts',
                    style: Theme.of(context).textTheme.headlineLarge)),
          ),

          SliverList.builder(
            itemBuilder: (context, index) {
              return Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: ListTile(
                  title: Text('List Item $index'),
                ),
              );
            },
            itemCount: 10,
          )
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.refresh_outlined),
      ),
    );
  }
}
