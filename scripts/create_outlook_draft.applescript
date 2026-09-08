-- Creates an Outlook draft (never sends) with HTML content read from a file.
-- Usage: osascript create_outlook_draft.applescript <html_file_path> <episode_number> <episode_theme> <to_email>
-- Subject is built as: 🎧 AI Podcast Episode <N> - <theme>
on run argv
	set htmlPath to item 1 of argv
	set episodeNumber to item 2 of argv
	set episodeTheme to item 3 of argv
	set toEmail to item 4 of argv
	set theSubject to "🎧 AI Podcast Episode " & episodeNumber & " - " & episodeTheme

	set htmlText to (read (POSIX file htmlPath) as «class utf8»)

	tell application "Microsoft Outlook"
		set newMsg to make new outgoing message with properties {subject:theSubject, content:htmlText}
		make new to recipient at newMsg with properties {email address:{address:toEmail}}
		open newMsg
		activate
	end tell
end run
