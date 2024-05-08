using iEvent.Domain.Models;
using iEvent.Infastructure;

namespace iEvent.Domain.Repositories
{
    internal class CommentRepository: ICommentRepository
    {
        private readonly ApplicationDbContext _context;

        public CommentRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public void AddComment(Comment com)
        {
            _context.Comments.Add(com);
        }

    }
}
