import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';

import 'common/icon_item.dart';

final _iconNames = YaruIcons.all.keys.toList();

final List<IconItem> iconItems = [
  for (final iconName in _iconNames)
    IconItem(
      name: iconName,
      usage: 'YaruIcons.$iconName',
      iconBuilder: (context, iconSize) => Icon(
        YaruIcons.all[iconName]!,
        size: iconSize,
      ),
    )
];

final List<IconItem> animatedIconItems = [
  IconItem(
    name: 'Ok',
    usage: 'YaruAnimatedOkIcon()',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedOkIcon(),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Ok filled',
    usage: 'YaruAnimatedOkIcon(filled: true)',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedOkIcon(filled: true),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'No network',
    usage: 'YaruAnimatedNoNetworkIcon()',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedNoNetworkIcon(),
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Compass',
    usage: 'YaruAnimatedCompassIcon()',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedCompassIcon(),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Compass filled',
    usage: 'YaruAnimatedCompassIcon(filled: true)',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedCompassIcon(filled: true),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Heart',
    usage: 'YaruAnimatedHeartIcon()',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedHeartIcon(),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Heart filled',
    usage: 'YaruAnimatedHeartIcon(filled: true)',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedHeartIcon(filled: true),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Star',
    usage: 'YaruAnimatedStarIcon()',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedStarIcon(),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Star semi filled',
    usage: 'YaruAnimatedStarIcon(filled: true, fillSize: .5)',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedStarIcon(filled: true, fillSize: .5),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Star filled',
    usage: 'YaruAnimatedStarIcon(filled: true)',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedStarIcon(filled: true),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
];

final List<IconItem> widgetIconItems = [
  IconItem(
    name: 'Placeholder',
    usage: 'YaruPlaceholderIcon()',
    iconBuilder: (context, iconSize) => YaruPlaceholderIcon(
      size: Size.square(iconSize),
    ),
  ),
];
