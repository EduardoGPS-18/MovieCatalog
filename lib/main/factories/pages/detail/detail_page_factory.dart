import 'package:flutter/material.dart';

import '../../../../ui/pages/detail/detail.dart';
import 'detail_presenter_factory.dart';

Widget makeDetailPage() => DetailPage(makeDetailPresenter());
