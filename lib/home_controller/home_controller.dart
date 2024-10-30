import 'package:get/get.dart';

class HomeController extends GetxController {
  bool sector = false;
  bool commercial = false;
  bool employment = false;
  bool financial = false;
  bool planning = false;
  bool hr = false;
  bool projects = false;
  bool labs = false;
  bool support = false;
  void sector_() {
    sector = !sector;
    update();
  }

  void commercial_() {
    commercial = !commercial;
    update();
  }

  void employment_() {
    employment = !employment;
    update();
  }

  void financial_() {
    financial = !financial;
    update();
  }

  void planning_() {
    planning = !planning;
    update();
  }

  void hr_() {
    hr = !hr;
    update();
  }

  void projects_() {
    projects = !projects;
    update();
  }

  void labs_() {
    labs = !labs;
    update();
  }

  void support_() {
    support = !support;
    update();
  }
}
