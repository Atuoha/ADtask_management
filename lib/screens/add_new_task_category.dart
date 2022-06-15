import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../model/task_category.dart';
import '../providers/task_category.dart';
import 'package:icon_picker/icon_picker.dart';
import 'package:color_picker_field/color_picker_field.dart';

class AddNewTaskCategory extends StatefulWidget {
  static const routeName = '/newtaskcategory';
  const AddNewTaskCategory({Key? key}) : super(key: key);

  @override
  State<AddNewTaskCategory> createState() => _AddNewTaskCategoryState();
}

class _AddNewTaskCategoryState extends State<AddNewTaskCategory> {
  var form = GlobalKey<FormState>();
  var _editTaskCategory = TaskCategory(
    id: '',
    icon: Icons.work,
    iconColor: kRedDark,
    bgColor: kRed,
    btnColor: kRedLight,
    title: '',
  );
  var _initialValue = {
    'category_title': 'Title',
  };

  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      var categoryId = ModalRoute.of(context)!.settings.arguments as String;
      // ignore: unnecessary_null_comparison
      if (categoryId != null) {
        _editTaskCategory = Provider.of<TaskCategoryData>(
          context,
          listen: false,
        ).findById(categoryId);
        _initialValue = {
          'category_title': _editTaskCategory.title.toString(),
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveData() {
    final isValid = form.currentState!.validate();
    if (!isValid) {
      return;
    }
    form.currentState!.save();
    if (_editTaskCategory.id == '') {
      // create
      Provider.of<TaskCategoryData>(
        context,
        listen: false,
      ).addTaskCategory(_editTaskCategory);
    } else {
      //update
    }
    Navigator.of(context).pop();
  }

  final Map<String, IconData> myIconCollection = {
    'favorite': Icons.favorite,
    'home': Icons.home,
    'access_alarms': Icons.access_alarms,
    'album': Icons.album,
    'person': Icons.person,
    'work': Icons.work,
    'photo': Icons.photo,
    'shopping_cart': Icons.shopping_cart,
    'airport_shuttle': Icons.airport_shuttle,
    'account_balance': Icons.account_balance,
    'add_location': Icons.add_location,
    'attach_money': Icons.attach_money,
    'audiotrack': Icons.audiotrack,
    'autorenew': Icons.autorenew,
    'beach_access': Icons.beach_access,
    'book': Icons.book,
    'bug_report': Icons.bug_report,
    'build': Icons.build,
    'business': Icons.business,
    'business_center': Icons.business_center,
    'cake': Icons.cake,
    'call': Icons.call,
    'camera': Icons.camera,
    'cancel': Icons.cancel,
    'card_giftcard': Icons.card_giftcard,
    'chat': Icons.chat,
    'child_card': Icons.child_care,
    'child_friendly': Icons.child_friendly,
    'cloud': Icons.cloud,
    'code': Icons.code,
    'computer': Icons.computer,
    'contact_mail': Icons.contact_mail,
    'contact_phone': Icons.contact_phone,
    'contacts': Icons.contacts,
    'credit_card': Icons.credit_card,
    'delete': Icons.delete,
    'delete_forever': Icons.delete_forever,
    'delete_sweep': Icons.delete_sweep,
    'departure_board': Icons.departure_board,
    'description': Icons.description,
    'developer_mode': Icons.developer_mode,
    'device_hub': Icons.device_hub,
    'devices': Icons.devices,
    'direction': Icons.directions,
    'directions_bike': Icons.directions_bike,
    'directions_boat': Icons.directions_boat,
    'directions_bus': Icons.directions_bus,
    'directions_car': Icons.directions_car,
    'directions_railway': Icons.directions_railway,
    'directions_run': Icons.directions_run,
    'directions_subway': Icons.directions_subway,
    'directions_transit': Icons.directions_transit,
    'directions_walk': Icons.directions_walk,
    'drafts': Icons.drafts,
    'drive_eta': Icons.drive_eta,
    'email': Icons.email,
    'ev_station': Icons.ev_station,
    'event': Icons.event,
    'face': Icons.face,
    'fastfood': Icons.fastfood,
    'fitness_center': Icons.fitness_center,
    'flag': Icons.flag,
    'flight': Icons.flight,
    'forum': Icons.forum,
    'free_breakfast': Icons.free_breakfast,
    'g_translate': Icons.g_translate,
    'gamepad': Icons.gamepad,
    'golf_course': Icons.golf_course,
    'group': Icons.group,
    'headset_mic': Icons.headset_mic,
    'hot_tub': Icons.hot_tub,
    'hotel': Icons.hotel,
    'keyboard_voice': Icons.keyboard_voice,
    'kitchen': Icons.kitchen,
    'laptop': Icons.laptop,
    'books': Icons.library_books,
    'library_music': Icons.library_music,
    'add': Icons.add,
    'live_tv': Icons.live_tv,
    'map': Icons.map,
    'montization_on': Icons.monetization_on,
    'money_off': Icons.money_off,
    'navigation': Icons.navigation,
    'note_Add': Icons.note_add,
    'payment': Icons.payment,
    'person_add': Icons.person_add,
    'pets': Icons.pets,
    'pregnant_woman': Icons.pregnant_woman,
    'print': Icons.print,
    'priority_high': Icons.priority_high,
    'public': Icons.public,
    'publish': Icons.publish,
    'receipt': Icons.receipt,
    'redo': Icons.redo,
    'restaurant': Icons.restaurant,
    'school': Icons.school,
    'security': Icons.security,
    'spellcheck': Icons.spellcheck,
    'star': Icons.star,
    'warning': Icons.warning,
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        title: const Text(
          'Add New Task Category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Entypo.dots_two_vertical,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Add a new task category',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(116, 255, 255, 255),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                width: double.infinity,
                height: double.infinity,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Form(
                    key: form,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: _initialValue['title'],
                          onSaved: (value) {
                            _editTaskCategory = TaskCategory(
                              id: _editTaskCategory.id,
                              icon: _editTaskCategory.icon,
                              iconColor: _editTaskCategory.iconColor,
                              bgColor: _editTaskCategory.bgColor,
                              btnColor: _editTaskCategory.btnColor,
                              title: value,
                            );
                          },
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.title),
                            hintText: 'Task Category Title',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'A title is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        IconPicker(
                          initialValue: 'favorite',
                          icon: const Icon(Icons.apps),
                          // labelText: "Icon",
                          title: "Select an icon",
                          cancelBtn: "Cancel",
                          enableSearch: true,
                          searchHint: 'Search icon',
                          iconCollection: myIconCollection,
                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'An icon is required';
                            }
                            return null;
                          },

                          onSaved: (val) {
                            var iconDataJson = jsonDecode(val.toString());
                            // var iconName = iconDataJson['codePoint'];
                            IconData icon = IconData(
                              iconDataJson['codePoint'],
                              fontFamily: iconDataJson['fontFamily'],
                            );
                            _editTaskCategory = TaskCategory(
                              id: _editTaskCategory.id,
                              icon: icon,
                              iconColor: _editTaskCategory.iconColor,
                              bgColor: _editTaskCategory.bgColor,
                              btnColor: _editTaskCategory.btnColor,
                              title: _editTaskCategory.title,
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        ColorPickerFormField(
                          initialValue: [],
                          defaultColor: Colors.blue,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxColors: 1,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.color_lens),
                            hintText: 'Color Picker',
                          ),
                          validator: (List<Color>? value) {
                            if (value!.isEmpty) {
                              return 'a color is required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editTaskCategory = TaskCategory(
                              id: _editTaskCategory.id,
                              icon: _editTaskCategory.icon,
                              iconColor: value![0],
                              bgColor: value[0].withOpacity(0.6),
                              btnColor: value[0].withOpacity(0.2),
                              title: _editTaskCategory.title,
                            );
                          },
                        ),
                        ElevatedButton(
                          onPressed: () => _saveData(),
                          style: ElevatedButton.styleFrom(
                            primary: kBlueDarker,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Submit New Task Category',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}