/// The overall brightness of this color scheme.
final Brightness brightness;

/// The color displayed most frequently across your app’s screens and components.
final Color primary;

/// A color that's clearly legible when drawn on [primary].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [primary] and [onPrimary] of at least 4.5:1 is recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
final Color onPrimary;

final Color? _primaryContainer;
/// A color used for elements needing less emphasis than [primary].
Color get primaryContainer => _primaryContainer ?? primary;

final Color? _onPrimaryContainer;
/// A color that's clearly legible when drawn on [primaryContainer].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [primaryContainer] and [onPrimaryContainer] of at least 4.5:1
/// is recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
Color get onPrimaryContainer => _onPrimaryContainer ?? onPrimary;

/// An accent color used for less prominent components in the UI, such as
/// filter chips, while expanding the opportunity for color expression.
final Color secondary;

/// A color that's clearly legible when drawn on [secondary].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [secondary] and [onSecondary] of at least 4.5:1 is recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
final Color onSecondary;

final Color? _secondaryContainer;
/// A color used for elements needing less emphasis than [secondary].
Color get secondaryContainer => _secondaryContainer ?? secondary;

final Color? _onSecondaryContainer;
/// A color that's clearly legible when drawn on [secondaryContainer].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [secondaryContainer] and [onSecondaryContainer] of at least 4.5:1 is
/// recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
Color get onSecondaryContainer => _onSecondaryContainer ?? onSecondary;

final Color? _tertiary;
/// A color used as a contrasting accent that can balance [primary]
/// and [secondary] colors or bring heightened attention to an element,
/// such as an input field.
Color get tertiary => _tertiary ?? secondary;

final Color? _onTertiary;
/// A color that's clearly legible when drawn on [tertiary].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [tertiary] and [onTertiary] of at least 4.5:1 is recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
Color get onTertiary => _onTertiary ?? onSecondary;

final Color? _tertiaryContainer;
/// A color used for elements needing less emphasis than [tertiary].
Color get tertiaryContainer => _tertiaryContainer ?? tertiary;

final Color? _onTertiaryContainer;
/// A color that's clearly legible when drawn on [tertiaryContainer].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [tertiaryContainer] and [onTertiaryContainer] of at least 4.5:1 is
/// recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
Color get onTertiaryContainer => _onTertiaryContainer ?? onTertiary;

/// The color to use for input validation errors, e.g. for
/// [InputDecoration.errorText].
final Color error;

/// A color that's clearly legible when drawn on [error].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [error] and [onError] of at least 4.5:1 is recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
final Color onError;

final Color? _errorContainer;
/// A color used for error elements needing less emphasis than [error].
Color get errorContainer => _errorContainer ?? error;

final Color? _onErrorContainer;
/// A color that's clearly legible when drawn on [errorContainer].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [errorContainer] and [onErrorContainer] of at least 4.5:1 is
/// recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
Color get onErrorContainer => _onErrorContainer ?? onError;

/// A color that typically appears behind scrollable content.
final Color background;

/// A color that's clearly legible when drawn on [background].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [background] and [onBackground] of at least 4.5:1 is recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
final Color onBackground;

/// The background color for widgets like [Card].
final Color surface;

/// A color that's clearly legible when drawn on [surface].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [surface] and [onSurface] of at least 4.5:1 is recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
final Color onSurface;

final Color? _surfaceVariant;
/// A color variant of [surface] that can be used for differentiation against
/// a component using [surface].
Color get surfaceVariant => _surfaceVariant ?? surface;

final Color? _onSurfaceVariant;
/// A color that's clearly legible when drawn on [surfaceVariant].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [surfaceVariant] and [onSurfaceVariant] of at least 4.5:1 is
/// recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
Color get onSurfaceVariant => _onSurfaceVariant ?? onSurface;

final Color? _outline;
/// A utility color that creates boundaries and emphasis to improve usability.
Color get outline => _outline ?? onBackground;

final Color? _shadow;
/// A color use to paint the drop shadows of elevated components.
Color get shadow => _shadow ?? const Color(0xff000000);

final Color? _inverseSurface;
/// A surface color used for displaying the reverse of what’s seen in the
/// surrounding UI, for example in a SnackBar to bring attention to
/// an alert.
Color get inverseSurface => _inverseSurface ?? onSurface;

final Color? _onInverseSurface;
/// A color that's clearly legible when drawn on [inverseSurface].
///
/// To ensure that an app is accessible, a contrast ratio between
/// [inverseSurface] and [onInverseSurface] of at least 4.5:1 is
/// recommended. See
/// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
Color get onInverseSurface => _onInverseSurface ?? surface;

final Color? _inversePrimary;
/// An accent color used for displaying a highlight color on [inverseSurface]
/// backgrounds, like button text in a SnackBar.
Color get inversePrimary => _inversePrimary ?? onPrimary;

final Color? _surfaceTint;
/// A color used as an overlay on a surface color to indicate a component's
/// elevation.
Color get surfaceTint => _surfaceTint ?? primary;

final Color? _primaryVariant;
/// A darker version of the primary color.
@Deprecated(
'Use primary or primaryContainer instead. '
'This feature was deprecated after v2.6.0-0.0.pre.'
)
Color get primaryVariant => _primaryVariant ?? primary;

final Color? _secondaryVariant;
/// A darker version of the secondary color.
@Deprecated(
'Use secondary or secondaryContainer instead. '
'This feature was deprecated after v2.6.0-0.0.pre.'
)
Color get secondaryVariant => _secondaryVariant ?? secondary;
