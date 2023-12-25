import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

public var scripts: [TargetScript] {

	var scripts = [TargetScript]()

	let swiftLintScriptString = "SwiftLint/swiftlint --fix && SwiftLint/swiftlint"
	let swiftLintScript = TargetScript.post(script: swiftLintScriptString, name: "SwiftLint")

	scripts.append(swiftLintScript)
	return scripts
}

let project = Project(
	name: "MdEdit",
	targets: [
		Target(
			name: "MdEdit",
			platform: .iOS,
			product: .app,
			bundleId: "ru.ioskendev.MyApp",
			infoPlist: "Resources/Info.plist",
			sources: ["Sources/**"],
			resources: ["Resources/**"],
			scripts: scripts,
			dependencies: [
				/* Target dependencies can be defined here */
				/* .framework(path: "framework") */
			]
		)
	]
)
