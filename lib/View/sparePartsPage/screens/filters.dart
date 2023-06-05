import 'package:flutter/material.dart';

import '../widget/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilter;
  final Map<String, bool> currentFilter;

  const FiltersScreen(this.saveFilter, this.currentFilter, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _vegan = widget.currentFilter['vegan']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    super.initState();
  }

  Widget _buidSwitchListTile(
    String titel,
    String subTitle,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(titel),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Filters"),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  final Map<String, bool> selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilter(selectedFilters);
                  final snackBar = SnackBar(
                      content: const Text('Changes saved!'),
                      action: SnackBarAction(
                        label: 'See The Meals',
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your Spareparts Selection.",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buidSwitchListTile(
                      "HONDA", "Only include Honda spareparts", _glutenFree,
                      (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  }),
                  _buidSwitchListTile(
                      "COROLLA", "Only include Corolla spareparts", _vegetarian,
                      (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                  }),
                  _buidSwitchListTile(
                      "SUZUKI", "Only include Suzuki spareparts", _lactoseFree,
                      (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  }),
                  _buidSwitchListTile(
                      "KIA", "Only include KIA spareparts", _vegan, (val) {
                    setState(() {
                      _vegan = val;
                    });
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
