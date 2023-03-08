import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
class FilterScreen extends StatefulWidget {
  static const routeName = 'Filter';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen(this.currentFilters,this.saveFilters,{Key key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  initState(){
    super.initState();
     _GlutenFree = widget.currentFilters['gluten'];
     _LactoseFree = widget.currentFilters['lacoste'];
     _Vegan = widget.currentFilters['vegan'];
     _Vegetarian = widget.currentFilters['vegetarian'];
  }
  SwitchListTile buildSwitchListTile(BuildContext context,
      {@required String title,
      @required String subtitle,
      @required bool value,
      @required Function onChanged}) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title),
      subtitle: Text(subtitle),
      activeColor: Theme.of(context).colorScheme.primary,
      inactiveThumbColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: (){
                final Map<String,bool>selectedFilters={
                  'gluten': _GlutenFree,
                  'lacoste': _LactoseFree,
                  'vegan': _Vegan,
                  'vegetarian': _Vegetarian,
                };
                widget.saveFilters(selectedFilters);
                showToast('Filter is Saved successfully',
                  context: context,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(30),
                  animation: StyledToastAnimation.slideFromBottom,
                  reverseAnimation: StyledToastAnimation.fade,
                  position: StyledToastPosition(align: Alignment.bottomCenter,offset: 80),
                  animDuration: Duration(seconds: 1),
                  duration: Duration(seconds: 2),
                  curve: Curves.elasticOut,
                  reverseCurve: Curves.linear,
                );
              },
              icon: Icon(
                Icons.save_outlined,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Text(
              'Filter your meals selections',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.bold),
            )),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  context,
                  title: 'Gluten-Free',
                  value: _GlutenFree,
                  onChanged: (value) {
                    setState(() {
                      _GlutenFree = value;
                    });
                  },
                  subtitle: 'only show gluten-free meals',
                ),
                buildSwitchListTile(
                  context,
                  title: 'Lactose-Free',
                  value: _LactoseFree,
                  onChanged: (value) {
                    setState(() {
                      _LactoseFree = value;
                    });
                  },
                  subtitle: 'only show lactose-free meals',
                ),
                buildSwitchListTile(
                  context,
                  title: 'Vegetarian ',
                  value: _Vegetarian,
                  onChanged: (value) {
                    setState(() {
                      _Vegetarian = value;
                    });
                  },
                  subtitle: 'only show vegetarian  meals',
                ),
                buildSwitchListTile(
                  context,
                  title: 'Vegan',
                  value: _Vegan,
                  onChanged: (value) {
                    setState(() {
                      _Vegan = value;
                    });
                  },
                  subtitle: 'only show vegan meals',
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
