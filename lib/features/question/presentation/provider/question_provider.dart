import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/service_locator.dart';
import '../../data/models/question_model.dart';
import '../../domain/usecases/question_useCase.dart';
import '../model/input_get_question.dart';
import 'question_state.dart';

class QuestionNotifier extends StateNotifier<QuestionState> {
  QuestionNotifier() : super(const QuestionState.initial());

  final QuestionGetAllUseCase _getAllUseCase = locator<QuestionGetAllUseCase>();
  final QuestionAddOrUpdateUseCase _addUseCase =
      locator<QuestionAddOrUpdateUseCase>();
  final QuestionDeleteUseCase _deleteUseCase = locator<QuestionDeleteUseCase>();

  final QuestionListLocalDeleteAllUpdatedUseCase
      _listLocalDeleteAllUpdatedUseCase =
      locator<QuestionListLocalDeleteAllUpdatedUseCase>();
  final QuestionListLocalDeleteAllUseCase _listLocalDeleteAllUseCase =
      locator<QuestionListLocalDeleteAllUseCase>();

  final QuestionListLocalAddOrUpdateUseCase _listLocalAddOrUpdateUseCase =
      locator<QuestionListLocalAddOrUpdateUseCase>();
  final QuestionListLocalDeleteUseCase _localDeleteUseCase =
      locator<QuestionListLocalDeleteUseCase>();
  final QuestionSearchUseCase _searchUseCase = locator<QuestionSearchUseCase>();

  Future<void> getAllQuestions() async {
    state = const QuestionState.loading();
    final result = await _getAllUseCase.execute(Void);
    result.fold(
      (failure) => state = QuestionState.error(failure),
      (data) => state = QuestionState.success(data),
    );
  }

  Future<void> addOrUpdateQuestion({required Question model}) async {
    state = const QuestionState.addLoading();
    final result = await _addUseCase.execute(model);
    result.fold(
      (failure) => state = QuestionState.addError(failure),
      (data) {
        getAllQuestions();
        state = const QuestionState.addSuccess();
      },
    );
  }

  Future<void> deleteQuestion({required String id}) async {
    state = const QuestionState.deleteLoading();
    final result = await _deleteUseCase.execute(id);
    result.fold(
      (failure) => state = QuestionState.deleteError(failure),
      (data) {
        getAllQuestions();
        state = const QuestionState.deleteSuccess();
      },
    );
  }

  Future<void> deleteAllLocalDeletedItems() async {
    final result = await _listLocalDeleteAllUseCase.execute(Void);
    result.fold(
      (failure) => state = QuestionState.error(failure),
      (_) => debugPrint('Deleted all local deleted items'),
    );
  }

  Future<void> deleteAllLocalUpdatedItems() async {
    final result = await _listLocalDeleteAllUpdatedUseCase.execute(Void);
    result.fold(
      (failure) => state = QuestionState.error(failure),
      (_) => debugPrint('Deleted all local updated items'),
    );
  }

  Future<void> getAddOrUpdateListLocalAddUploadToFirebase() async {
    final result = await _listLocalAddOrUpdateUseCase.execute(Void);
    result.fold(
      (failure) => state = QuestionState.error(failure),
      (data) async {
        if (data.isNotEmpty) {
          for (var item in data) {
            await uploadToFirebaseWhenOnline(item);
          }
          getAllQuestions();
          deleteAllLocalUpdatedItems();
        }
      },
    );
  }

  Future<void> getDeletedListLocalAndUploadToFirebase() async {
    final result = await _localDeleteUseCase.execute(Void);
    result.fold(
      (failure) => state = QuestionState.error(failure),
      (data) async {
        if (data.isNotEmpty) {
          for (var item in data) {
            await deleteFromFirebaseWhenOnline(item);
          }
          getAllQuestions();
          deleteAllLocalDeletedItems();
        }
      },
    );
  }

  Future<void> uploadToFirebaseWhenOnline(Question model) async {
    final result = await _addUseCase.execute(model);
    result.fold(
      (failure) => state = QuestionState.error(failure),
      (_) => debugPrint('Uploaded to Firebase'),
    );
  }

  Future<void> deleteFromFirebaseWhenOnline(String id) async {
    final result = await _deleteUseCase.execute(id);
    result.fold(
      (failure) => state = QuestionState.error(failure),
      (_) => debugPrint('Deleted from Firebase'),
    );
  }

  Future<void> checkDataWhenOnline() async {
    await getAddOrUpdateListLocalAddUploadToFirebase();
    await getDeletedListLocalAndUploadToFirebase();
  }

  Future<void> searchQuestion({required InputGetQuestion search}) async {
    state = const QuestionState.loading();
    final result = await _searchUseCase.execute(search);
    result.fold(
      (failure) => state = QuestionState.error(failure),
      (data) => state = QuestionState.success(data),
    );
  }

  final List<Question> _questions = [
    Question(
        id: '1',
        name: 'Tell me about yourself.',
        status: 'easy',
        example:
            'I am a software engineer with 5 years of experience in developing mobile applications.'),
    Question(
        id: '2',
        name: 'What are your greatest strengths?',
        status: 'medium',
        example:
            'I am highly adaptable and always eager to learn new technologies.'),
    Question(
        id: '3',
        name: 'What are your weaknesses?',
        status: 'medium',
        example:
            'I tend to take on too much responsibility, but I am learning to delegate.'),
    Question(
        id: '4',
        name: 'Why do you want to work here?',
        status: 'easy',
        example:
            'I admire your company culture and the opportunity to work on innovative projects.'),
    Question(
        id: '5',
        name: 'Where do you see yourself in five years?',
        status: 'medium',
        example:
            'I see myself in a leadership role, helping to drive strategic initiatives.'),
    Question(
        id: '6',
        name: 'Why should we hire you?',
        status: 'hard',
        example:
            'I bring unique skills and experiences that will contribute to your team and projects.'),
    Question(
        id: '7',
        name: 'Describe a challenging situation and how you overcame it.',
        status: 'hard',
        example:
            'In my last project, we faced tight deadlines. I organized the team and prioritized tasks, which led to successful delivery.'),
    Question(
        id: '8',
        name: 'What motivates you?',
        status: 'medium',
        example:
            'I am motivated by solving problems and the satisfaction of delivering quality work.'),
    Question(
        id: '9',
        name: 'How do you handle stress and pressure?',
        status: 'medium',
        example:
            'I stay organized and focus on what I can control, often taking breaks to clear my mind.'),
    Question(
        id: '10',
        name: 'Describe your work style.',
        status: 'easy',
        example:
            'I am collaborative and enjoy brainstorming with my team, while also being focused and results-driven.'),
    Question(
        id: '11',
        name: 'What is your salary expectation?',
        status: 'medium',
        example:
            'I am looking for a salary in the range of 100 to 1000, depending on the role and responsibilities.'),
    Question(
        id: '12',
        name: 'How do you prioritize your work?',
        status: 'medium',
        example:
            'I evaluate tasks based on urgency and importance, using a task management tool to keep track.'),
    Question(
        id: '13',
        name: 'Tell me about a time you worked in a team.',
        status: 'medium',
        example:
            'I collaborated with my team to develop a mobile app, ensuring clear communication and shared goals.'),
    Question(
        id: '14',
        name: 'How do you handle feedback?',
        status: 'easy',
        example:
            'I appreciate constructive feedback and use it to improve my skills and performance.'),
    Question(
        id: '15',
        name: 'Describe a time when you showed leadership.',
        status: 'hard',
        example:
            'During a project crisis, I stepped up to coordinate our efforts and communicate with stakeholders.'),
    Question(
        id: '16',
        name: 'What do you like to do outside of work?',
        status: 'easy',
        example: 'I enjoy hiking and reading about technology trends.'),
    Question(
        id: '17',
        name: 'How do you stay organized?',
        status: 'medium',
        example:
            'I use digital tools like Trello and Google Calendar to manage my tasks and deadlines.'),
    Question(
        id: '18',
        name: 'What are your career goals?',
        status: 'medium',
        example:
            'I aim to develop my technical skills and eventually lead a team of developers.'),
    Question(
        id: '19',
        name: 'Describe a project you are proud of.',
        status: 'medium',
        example:
            'I led the development of a successful mobile app that improved user engagement by 40%.'),
    Question(
        id: '20',
        name: 'How do you deal with difficult coworkers?',
        status: 'hard',
        example:
            'I try to understand their perspective and communicate openly to resolve conflicts.'),
    Question(
        id: '21',
        name: 'What is your greatest achievement?',
        status: 'medium',
        example:
            'I successfully launched a product that generated significant revenue for the company.'),
    Question(
        id: '22',
        name: 'Why did you leave your last job?',
        status: 'medium',
        example:
            'I was looking for new challenges and opportunities for growth.'),
    Question(
        id: '23',
        name: 'How do you keep your skills updated?',
        status: 'medium',
        example:
            'I regularly take online courses and attend industry conferences.'),
    Question(
        id: '24',
        name: 'What are your thoughts on teamwork?',
        status: 'easy',
        example:
            'I believe teamwork fosters creativity and drives better results.'),
    Question(
        id: '25',
        name: 'How do you manage your time effectively?',
        status: 'medium',
        example:
            'I set clear deadlines and break tasks into manageable chunks.'),
    Question(
        id: '26',
        name: 'What role do you usually take in team projects?',
        status: 'medium',
        example:
            'I often take the role of the coordinator, ensuring everyone stays on track.'),
    Question(
        id: '27',
        name: 'Can you describe your problem-solving process?',
        status: 'medium',
        example:
            'I define the problem, brainstorm solutions, evaluate options, and implement the best choice.'),
    Question(
        id: '28',
        name: 'How do you handle tight deadlines?',
        status: 'hard',
        example:
            'I prioritize tasks and communicate with my team to ensure we meet our goals.'),
    Question(
        id: '29',
        name: 'What do you consider to be your biggest failure?',
        status: 'hard',
        example:
            'I once mismanaged a project timeline, but I learned the importance of planning ahead.'),
    Question(
        id: '30',
        name: 'What is your favorite programming language?',
        status: 'easy',
        example: 'I enjoy using Python for its simplicity and versatility.'),
    Question(
        id: '31',
        name: 'How do you handle conflicts in the workplace?',
        status: 'hard',
        example:
            'I address conflicts directly and work towards a resolution that benefits everyone.'),
    Question(
        id: '32',
        name: 'What are your thoughts on remote work?',
        status: 'medium',
        example:
            'I appreciate the flexibility it offers and find I am more productive at home.'),
    Question(
        id: '33',
        name: 'How do you stay motivated during long projects?',
        status: 'medium',
        example:
            'I set mini-goals and celebrate small wins to maintain my enthusiasm.'),
    Question(
        id: '34',
        name: 'Describe a time when you had to learn something new quickly.',
        status: 'hard',
        example:
            'I had to learn a new programming framework for a project and dedicated extra hours to master it.'),
    Question(
        id: '35',
        name: 'What is your approach to learning new technologies?',
        status: 'medium',
        example:
            'I dive into hands-on projects and seek online resources to understand concepts better.'),
    Question(
        id: '36',
        name: 'What do you enjoy most about your job?',
        status: 'easy',
        example:
            'I love the challenge of solving complex problems and working with talented people.'),
    Question(
        id: '37',
        name: 'How do you ensure quality in your work?',
        status: 'medium',
        example:
            'I follow best practices and perform thorough testing before deployment.'),
    Question(
        id: '38',
        name:
            'What do you do if you disagree with a decision made by your supervisor?',
        status: 'hard',
        example:
            'I express my concerns respectfully and provide alternatives for consideration.'),
    Question(
        id: '39',
        name: 'Describe your ideal work environment.',
        status: 'easy',
        example:
            'I thrive in collaborative environments where creativity is encouraged.'),
    Question(
        id: '40',
        name: 'What techniques do you use to build rapport with clients?',
        status: 'medium',
        example:
            'I listen actively and empathize with their needs to establish trust.'),
    Question(
        id: '41',
        name: 'How do you measure success in your role?',
        status: 'medium',
        example:
            'I measure success through the impact of my work on team goals and client satisfaction.'),
    Question(
        id: '42',
        name:
            'What would you do if you were assigned a task you had never done before?',
        status: 'hard',
        example:
            'I would research, seek help if needed, and approach it with a positive mindset.'),
    Question(
        id: '43',
        name: 'How do you keep track of industry trends?',
        status: 'medium',
        example:
            'I follow industry leaders on social media and read relevant articles regularly.'),
    Question(
        id: '44',
        name: 'Describe a time when you had to adapt to a significant change.',
        status: 'hard',
        example:
            'When my company switched to a new project management tool, I embraced the change and helped train others.'),
    Question(
        id: '45',
        name: 'What is your approach to feedback?',
        status: 'medium',
        example:
            'I view feedback as an opportunity to improve and grow professionally.'),
    Question(
        id: '46',
        name: 'How do you manage competing priorities?',
        status: 'medium',
        example:
            'I assess the importance and urgency of tasks to allocate my time effectively.'),
    Question(
        id: '47',
        name: 'What would you do if you made a mistake on a project?',
        status: 'hard',
        example:
            'I would acknowledge the mistake, take responsibility, and implement a solution.'),
    Question(
        id: '48',
        name: 'What do you think is the most important skill for this role?',
        status: 'medium',
        example:
            'I believe strong communication skills are essential for collaboration.'),
    Question(
        id: '49',
        name: 'How do you handle criticism?',
        status: 'medium',
        example:
            'I take criticism constructively and reflect on how I can improve.'),
    Question(
        id: '50',
        name: 'What steps do you take to ensure your work is error-free?',
        status: 'medium',
        example: 'I double-check my work and seek peer reviews when possible.'),
    Question(
        id: '51',
        name: 'Describe your experience with project management.',
        status: 'hard',
        example:
            'I have managed multiple projects simultaneously, coordinating timelines and resources effectively.'),
    Question(
        id: '52',
        name: 'What do you think makes a good leader?',
        status: 'medium',
        example:
            'A good leader inspires others and fosters an inclusive environment.'),
    Question(
        id: '53',
        name: 'How do you handle underperforming team members?',
        status: 'hard',
        example:
            'I would have a candid conversation to understand the challenges they face and offer support.'),
    Question(
        id: '54',
        name: 'What strategies do you use for effective communication?',
        status: 'medium',
        example:
            'I adapt my communication style to suit my audience and ensure clarity.'),
    Question(
        id: '55',
        name: 'How do you define success in a team project?',
        status: 'medium',
        example:
            'Success is defined by meeting project goals and delivering value to stakeholders.'),
    Question(
        id: '56',
        name: 'What do you do to improve your performance?',
        status: 'medium',
        example:
            'I seek feedback and set specific goals for personal development.'),
    Question(
        id: '57',
        name: 'How do you approach networking?',
        status: 'medium',
        example:
            'I attend industry events and engage with peers on professional platforms.'),
    Question(
        id: '58',
        name: 'What are your thoughts on work-life balance?',
        status: 'medium',
        example:
            'I believe it’s essential for long-term productivity and well-being.'),
    Question(
        id: '59',
        name: 'Describe a time when you went above and beyond for a project.',
        status: 'hard',
        example:
            'I worked extra hours to ensure a critical deadline was met, resulting in a successful launch.'),
    Question(
        id: '60',
        name: 'How do you handle multiple deadlines?',
        status: 'medium',
        example:
            'I prioritize tasks and communicate with my team to manage expectations.'),
    Question(
        id: '61',
        name: 'What do you think is the biggest challenge in this industry?',
        status: 'hard',
        example:
            'Keeping up with rapid technological changes is a significant challenge we face.'),
    Question(
        id: '62',
        name: 'What qualities do you look for in a teammate?',
        status: 'medium',
        example: 'I value collaboration, honesty, and a strong work ethic.'),
    Question(
        id: '63',
        name: 'How do you maintain a positive attitude?',
        status: 'medium',
        example:
            'I focus on solutions and surround myself with positive influences.'),
    Question(
        id: '64',
        name: 'What are your thoughts on continuing education?',
        status: 'medium',
        example:
            'I believe it is crucial for personal and professional growth.'),
    Question(
        id: '65',
        name: 'How do you manage stress during busy times?',
        status: 'medium',
        example: 'I practice mindfulness techniques and make time for breaks.'),
    Question(
        id: '66',
        name: 'What is the most challenging aspect of your previous job?',
        status: 'hard',
        example:
            'Managing conflicting priorities from different stakeholders was quite challenging.'),
    Question(
        id: '67',
        name: 'What are your long-term career aspirations?',
        status: 'medium',
        example: 'I aspire to become a subject matter expert in my field.'),
    Question(
        id: '68',
        name: 'How do you approach a new project?',
        status: 'medium',
        example:
            'I begin with thorough research and planning to set clear objectives.'),
    Question(
        id: '69',
        name: 'Describe a time when you had to persuade someone.',
        status: 'hard',
        example:
            'I successfully convinced my team to adopt a new software tool that improved our workflow.'),
    Question(
        id: '70',
        name: 'How do you ensure collaboration in a remote team?',
        status: 'medium',
        example:
            'I promote regular check-ins and encourage open communication.'),
    Question(
        id: '71',
        name: 'What do you do when you disagree with your supervisor?',
        status: 'hard',
        example:
            'I approach them respectfully, presenting my viewpoint and data to support it.'),
    Question(
        id: '72',
        name: 'What is your experience with budgeting?',
        status: 'hard',
        example:
            'I have managed project budgets, ensuring we stay within financial constraints while meeting goals.'),
    Question(
        id: '73',
        name: 'How do you evaluate the success of a project?',
        status: 'medium',
        example:
            'I assess outcomes against our initial goals and stakeholder feedback.'),
    Question(
        id: '74',
        name: 'What techniques do you use for effective problem-solving?',
        status: 'medium',
        example:
            'I utilize analytical thinking and collaborative brainstorming sessions.'),
    Question(
        id: '75',
        name: 'How do you handle a lack of resources?',
        status: 'hard',
        example:
            'I prioritize tasks and communicate with stakeholders to manage expectations.'),
    Question(
        id: '76',
        name: 'What steps do you take to prepare for an interview?',
        status: 'medium',
        example:
            'I research the company, review common questions, and practice my answers.'),
    Question(
        id: '77',
        name: 'How do you stay productive during long hours?',
        status: 'medium',
        example:
            'I take regular breaks and set small goals to keep myself engaged.'),
    Question(
        id: '78',
        name: 'What is your experience with agile methodologies?',
        status: 'medium',
        example:
            'I have worked on agile teams, participating in sprints and daily stand-ups.'),
    Question(
        id: '79',
        name: 'Describe a time when you made a difficult decision.',
        status: 'hard',
        example:
            'I had to choose between two project proposals, weighing the potential impact and feasibility.'),
    Question(
        id: '80',
        name: 'How do you build a strong team culture?',
        status: 'hard',
        example:
            'I encourage open communication, recognition of achievements, and team-building activities.'),
    Question(
        id: '81',
        name: 'What do you think is the most rewarding part of your job?',
        status: 'medium',
        example:
            'The most rewarding part is seeing the positive impact of my work on clients and colleagues.'),
    Question(
        id: '82',
        name: 'How do you balance short-term and long-term goals?',
        status: 'medium',
        example:
            'I align daily tasks with overarching objectives to ensure we progress on both fronts.'),
    Question(
        id: '83',
        name: 'What strategies do you use for time management?',
        status: 'medium',
        example:
            'I employ the Pomodoro technique to maintain focus and productivity.'),
    Question(
        id: '84',
        name: 'Describe a time when you helped a team member.',
        status: 'hard',
        example:
            'I mentored a junior developer, guiding them through their first project and offering constructive feedback.'),
    Question(
        id: '85',
        name: 'How do you ensure effective communication within your team?',
        status: 'medium',
        example:
            'I promote transparency and use multiple channels to ensure everyone is informed.'),
    Question(
        id: '86',
        name: 'What do you consider to be the biggest risk in this role?',
        status: 'hard',
        example:
            'The biggest risk is the potential for project delays due to unforeseen challenges.'),
    Question(
        id: '87',
        name: 'How do you approach conflict resolution?',
        status: 'medium',
        example:
            'I listen to all parties involved and work towards a collaborative solution.'),
    Question(
        id: '88',
        name: 'What is your experience with data analysis?',
        status: 'medium',
        example:
            'I have performed data analysis to inform business decisions and strategies.'),
    Question(
        id: '89',
        name: 'How do you ensure customer satisfaction?',
        status: 'medium',
        example:
            'I actively seek feedback and implement improvements based on customer needs.'),
    Question(
        id: '90',
        name: 'What challenges do you foresee in this position?',
        status: 'hard',
        example:
            'I foresee challenges related to evolving technologies and meeting client expectations.'),
    Question(
        id: '91',
        name: 'What do you do to develop your leadership skills?',
        status: 'medium',
        example:
            'I seek mentorship and take on leadership roles in projects when possible.'),
    Question(
        id: '92',
        name: 'How do you approach personal development?',
        status: 'medium',
        example:
            'I set specific, measurable goals for learning new skills and seek feedback.'),
    Question(
        id: '93',
        name: 'What do you think sets you apart from other candidates?',
        status: 'hard',
        example:
            'My unique combination of skills, experience, and passion for this industry sets me apart.'),
    Question(
        id: '94',
        name: 'How do you handle monotony in your work?',
        status: 'medium',
        example:
            'I find ways to challenge myself and seek variety in my tasks.'),
    Question(
        id: '95',
        name: 'What do you believe is the key to successful teamwork?',
        status: 'medium',
        example:
            'Open communication and trust are essential for effective teamwork.'),
    Question(
        id: '96',
        name: 'Describe a time when you received positive feedback.',
        status: 'medium',
        example:
            'I was praised for my contributions to a project that exceeded client expectations.'),
    Question(
        id: '97',
        name: 'What are your thoughts on innovation?',
        status: 'medium',
        example:
            'Innovation drives progress, and I actively seek new ways to improve processes.'),
    Question(
        id: '98',
        name: 'How do you manage relationships with clients?',
        status: 'medium',
        example:
            'I maintain regular communication and ensure their needs are met consistently.'),
    Question(
        id: '99',
        name: 'What is your experience with crisis management?',
        status: 'hard',
        example:
            'I have led teams through crises, ensuring clear communication and quick action.'),
    Question(
        id: '100',
        name: 'How do you handle the pressure of deadlines?',
        status: 'hard',
        example:
            'I thrive under pressure by staying organized and focused on the end goal.'),
  ];

  void init() {
    for (var element in _questions) {
      addOrUpdateQuestion(model: element);
    }

    getAllQuestions();
  }
}

final questionNotifierProvider =
    StateNotifierProvider<QuestionNotifier, QuestionState>(
  (ref) {
    final questionNotifier = QuestionNotifier();
    questionNotifier.getAllQuestions(); // Fetch all questions on initialization
    return questionNotifier;
  },
);
