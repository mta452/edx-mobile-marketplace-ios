//
//  UpgradeCourseBlockView.swift
//  Course
//
//  Created by Anton Yarmolenka on 30/08/2024.
//

import SwiftUI
import Core
import Theme

struct UpgradeCourseBlockView: View {
    
    var viewModel: CourseUnitViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "lock.fill")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 14, height: 20)
                Text(CourseLocalization.Course.gradedAssignmentLocked)
                    .font(Theme.Fonts.titleMedium)
                    .foregroundColor(Theme.Colors.textPrimary)
                    .accessibilityIdentifier("graded_assignment_locked_text")
            }
            Text(CourseLocalization.Course.upgradeToGainAccess)
                .font(Theme.Fonts.bodyLarge)
                .foregroundColor(Theme.Colors.textPrimary)
                .accessibilityIdentifier("upgrade_to_gain_access_text")
                .padding(.top, 30)
            
            StyledButton(
                CourseLocalization.Course.upgradeNow,
                action: {
                    Task {
                        viewModel.showPaymentsInfo()
                    }
                },
                color: Theme.Colors.accentButtonColor,
                textColor: Theme.Colors.styledButtonText,
                leftImage: Image(systemName: "lock.fill"),
                imagesStyle: .attachedToText,
                isTitleTracking: false,
                isLimitedOnPad: false
            )
            .padding(.top, 30)
            Spacer()
        }
        .padding(20)
    }
}

#if DEBUG
struct UpgradeCourseBlockView_Previews: PreviewProvider {
    static var previews: some View {
        let courseStructure = CourseStructure(
            id: "123",
            graded: true,
            completion: 0,
            viewYouTubeUrl: "",
            encodedVideo: "",
            displayName: "Course 1",
            topicID: nil,
            childs: [],
            media: DataLayer.CourseMedia(image: DataLayer.Image(raw: "",
                                                                small: "",
                                                                large: "")),
            certificate: nil,
            org: "",
            isSelfPaced: true,
            isUpgradeable: false,
            sku: nil,
            coursewareAccessDetails: nil,
            courseProgress: nil,
            lmsPrice: .zero
        )
        let viewModel = CourseUnitViewModel(
            lessonID: "",
            courseID: "",
            courseName: "courseName",
            chapters: [],
            chapterIndex: 0,
            sequentialIndex: 0,
            verticalIndex: 0,
            courseStructure: courseStructure,
            interactor: CourseInteractor.mock,
            config: ConfigMock(),
            router: CourseRouterMock(),
            analytics: CourseAnalyticsMock(),
            connectivity: Connectivity(),
            storage: CourseStorageMock(),
            manager: DownloadManagerMock()
        )
        UpgradeCourseBlockView(viewModel: viewModel)
    }
}
#endif
