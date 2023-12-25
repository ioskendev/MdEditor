import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

public var scripts: [TargetScript] {

	var scripts = [TargetScript]()

	let swiftLintScriptString = """
	 export PATH="$PATH:/opt/homebrew/bin"
	 if which swiftlint > /dev/null; then
	   swiftlint
	 else
	   echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
	   exit 1
	 fi
	 """

	let swiftLintScript = TargetScript.post(script: swiftLintScriptString, name: "SwiftLint")

	scripts.append(swiftLintScript)
	return scripts
}

let project = Project(
	name: "MdEdit",
	targets: [
		Target(
			name: "MdEdit",
			destinations: .iOS,
			product: .app,
			bundleId: "com.ioskendev.MdEditor",
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
